IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'vwServicesListing', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwServicesListing'

GO
IF  EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'vwServicesListing', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwServicesListing'

GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OK_WebQueries_OK_Services]') AND parent_object_id = OBJECT_ID(N'[dbo].[OK_WebQueries]'))
ALTER TABLE [dbo].[OK_WebQueries] DROP CONSTRAINT [FK_OK_WebQueries_OK_Services]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OK_User_User_Types]') AND parent_object_id = OBJECT_ID(N'[dbo].[OK_User]'))
ALTER TABLE [dbo].[OK_User] DROP CONSTRAINT [FK_OK_User_User_Types]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OK_SERVICES_PROVIDER_MAP_OK_Services]') AND parent_object_id = OBJECT_ID(N'[dbo].[OK_SERVICES_PROVIDER_MAP]'))
ALTER TABLE [dbo].[OK_SERVICES_PROVIDER_MAP] DROP CONSTRAINT [FK_OK_SERVICES_PROVIDER_MAP_OK_Services]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OK_SERVICES_PROVIDER_MAP_OK_ServiceProvider]') AND parent_object_id = OBJECT_ID(N'[dbo].[OK_SERVICES_PROVIDER_MAP]'))
ALTER TABLE [dbo].[OK_SERVICES_PROVIDER_MAP] DROP CONSTRAINT [FK_OK_SERVICES_PROVIDER_MAP_OK_ServiceProvider]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OK_Services_BaseFare_FareType]') AND parent_object_id = OBJECT_ID(N'[dbo].[OK_Services_BaseFare]'))
ALTER TABLE [dbo].[OK_Services_BaseFare] DROP CONSTRAINT [FK_OK_Services_BaseFare_FareType]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OK_Services_OK_Services_BaseFare]') AND parent_object_id = OBJECT_ID(N'[dbo].[OK_Services]'))
ALTER TABLE [dbo].[OK_Services] DROP CONSTRAINT [FK_OK_Services_OK_Services_BaseFare]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OK_Services_OK_Categories]') AND parent_object_id = OBJECT_ID(N'[dbo].[OK_Services]'))
ALTER TABLE [dbo].[OK_Services] DROP CONSTRAINT [FK_OK_Services_OK_Categories]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OK_ServiceProvider_OK_ServiceProvider]') AND parent_object_id = OBJECT_ID(N'[dbo].[OK_ServiceProvider]'))
ALTER TABLE [dbo].[OK_ServiceProvider] DROP CONSTRAINT [FK_OK_ServiceProvider_OK_ServiceProvider]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OK_ServiceProvider_OK_PROVIDER_TYPE]') AND parent_object_id = OBJECT_ID(N'[dbo].[OK_ServiceProvider]'))
ALTER TABLE [dbo].[OK_ServiceProvider] DROP CONSTRAINT [FK_OK_ServiceProvider_OK_PROVIDER_TYPE]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OK_ServiceOrder_OK_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[OK_ServiceOrder]'))
ALTER TABLE [dbo].[OK_ServiceOrder] DROP CONSTRAINT [FK_OK_ServiceOrder_OK_User]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OK_ServiceOrder_OK_Services]') AND parent_object_id = OBJECT_ID(N'[dbo].[OK_ServiceOrder]'))
ALTER TABLE [dbo].[OK_ServiceOrder] DROP CONSTRAINT [FK_OK_ServiceOrder_OK_Services]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OK_ServiceOrder_OK_ServiceProvider]') AND parent_object_id = OBJECT_ID(N'[dbo].[OK_ServiceOrder]'))
ALTER TABLE [dbo].[OK_ServiceOrder] DROP CONSTRAINT [FK_OK_ServiceOrder_OK_ServiceProvider]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OK_Categories_OK_Categories]') AND parent_object_id = OBJECT_ID(N'[dbo].[OK_Categories]'))
ALTER TABLE [dbo].[OK_Categories] DROP CONSTRAINT [FK_OK_Categories_OK_Categories]
GO
/****** Object:  View [dbo].[vwServicesListing]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vwServicesListing]'))
DROP VIEW [dbo].[vwServicesListing]
GO
/****** Object:  View [dbo].[vwCategoriesListing]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vwCategoriesListing]'))
DROP VIEW [dbo].[vwCategoriesListing]
GO
/****** Object:  Table [dbo].[OK_WebQueries]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OK_WebQueries]') AND type in (N'U'))
DROP TABLE [dbo].[OK_WebQueries]
GO
/****** Object:  Table [dbo].[OK_User_Types]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OK_User_Types]') AND type in (N'U'))
DROP TABLE [dbo].[OK_User_Types]
GO
/****** Object:  Table [dbo].[OK_User]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OK_User]') AND type in (N'U'))
DROP TABLE [dbo].[OK_User]
GO
/****** Object:  Table [dbo].[OK_Slider_Image]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OK_Slider_Image]') AND type in (N'U'))
DROP TABLE [dbo].[OK_Slider_Image]
GO
/****** Object:  Table [dbo].[OK_SERVICES_PROVIDER_MAP]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OK_SERVICES_PROVIDER_MAP]') AND type in (N'U'))
DROP TABLE [dbo].[OK_SERVICES_PROVIDER_MAP]
GO
/****** Object:  Table [dbo].[OK_Services_BaseFare]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OK_Services_BaseFare]') AND type in (N'U'))
DROP TABLE [dbo].[OK_Services_BaseFare]
GO
/****** Object:  Table [dbo].[OK_Services]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OK_Services]') AND type in (N'U'))
DROP TABLE [dbo].[OK_Services]
GO
/****** Object:  Table [dbo].[OK_ServiceProvider]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OK_ServiceProvider]') AND type in (N'U'))
DROP TABLE [dbo].[OK_ServiceProvider]
GO
/****** Object:  Table [dbo].[OK_ServiceOrderAnswers]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OK_ServiceOrderAnswers]') AND type in (N'U'))
DROP TABLE [dbo].[OK_ServiceOrderAnswers]
GO
/****** Object:  Table [dbo].[OK_ServiceOrder]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OK_ServiceOrder]') AND type in (N'U'))
DROP TABLE [dbo].[OK_ServiceOrder]
GO
/****** Object:  Table [dbo].[OK_Questionnare]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OK_Questionnare]') AND type in (N'U'))
DROP TABLE [dbo].[OK_Questionnare]
GO
/****** Object:  Table [dbo].[OK_PROVIDER_TYPE]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OK_PROVIDER_TYPE]') AND type in (N'U'))
DROP TABLE [dbo].[OK_PROVIDER_TYPE]
GO
/****** Object:  Table [dbo].[OK_Categories]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OK_Categories]') AND type in (N'U'))
DROP TABLE [dbo].[OK_Categories]
GO
/****** Object:  Table [dbo].[OK_AnswerSet]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OK_AnswerSet]') AND type in (N'U'))
DROP TABLE [dbo].[OK_AnswerSet]
GO
/****** Object:  Table [dbo].[Net_Banking_List]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Net_Banking_List]') AND type in (N'U'))
DROP TABLE [dbo].[Net_Banking_List]
GO
/****** Object:  Table [dbo].[FareType]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FareType]') AND type in (N'U'))
DROP TABLE [dbo].[FareType]
GO
/****** Object:  UserDefinedFunction [dbo].[GetServiceRefNo]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetServiceRefNo]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[GetServiceRefNo]
GO
/****** Object:  StoredProcedure [servizee123].[usp_ChangePassword]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[servizee123].[usp_ChangePassword]') AND type in (N'P', N'PC'))
DROP PROCEDURE [servizee123].[usp_ChangePassword]
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateServices]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_UpdateServices]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_UpdateServices]
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateServiceProvider]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_UpdateServiceProvider]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_UpdateServiceProvider]
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateCategory]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_UpdateCategory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_UpdateCategory]
GO
/****** Object:  StoredProcedure [dbo].[usp_SheduleService3]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SheduleService3]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SheduleService3]
GO
/****** Object:  StoredProcedure [dbo].[usp_SheduleService2]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SheduleService2]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SheduleService2]
GO
/****** Object:  StoredProcedure [dbo].[usp_SheduleService]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SheduleService]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SheduleService]
GO
/****** Object:  StoredProcedure [dbo].[usp_SetUserAnswer]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SetUserAnswer]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SetUserAnswer]
GO
/****** Object:  StoredProcedure [dbo].[usp_SetServices]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SetServices]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SetServices]
GO
/****** Object:  StoredProcedure [dbo].[usp_SetServiceOrderAnswerSet]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SetServiceOrderAnswerSet]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SetServiceOrderAnswerSet]
GO
/****** Object:  StoredProcedure [dbo].[usp_SetServiceImage]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SetServiceImage]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SetServiceImage]
GO
/****** Object:  StoredProcedure [dbo].[usp_SetCategoryImage]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SetCategoryImage]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SetCategoryImage]
GO
/****** Object:  StoredProcedure [dbo].[usp_SetCategories]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SetCategories]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SetCategories]
GO
/****** Object:  StoredProcedure [dbo].[usp_ManageStatus]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ManageStatus]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ManageStatus]
GO
/****** Object:  StoredProcedure [dbo].[usp_ManageServiceType]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ManageServiceType]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ManageServiceType]
GO
/****** Object:  StoredProcedure [dbo].[usp_getUserDetails]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_getUserDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_getUserDetails]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetSliderImage]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetSliderImage]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_GetSliderImage]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetServicesListingsOnSearch]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetServicesListingsOnSearch]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_GetServicesListingsOnSearch]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetServicesListForWebService]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetServicesListForWebService]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_GetServicesListForWebService]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetServicesList]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetServicesList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_GetServicesList]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetService]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetService]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_GetService]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetQuestions]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetQuestions]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_GetQuestions]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetQuestionnareForOrder]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetQuestionnareForOrder]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_GetQuestionnareForOrder]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetQuestionnareDetails]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetQuestionnareDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_GetQuestionnareDetails]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetQuestionnare]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetQuestionnare]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_GetQuestionnare]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetNetBankingList]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetNetBankingList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_GetNetBankingList]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetCategory]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetCategory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_GetCategory]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetCategoriesListings]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetCategoriesListings]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_GetCategoriesListings]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetCategoriesListForDropDown]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetCategoriesListForDropDown]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_GetCategoriesListForDropDown]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetBaseFareForDropDown]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetBaseFareForDropDown]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_GetBaseFareForDropDown]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetAnswersetOfOrder]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetAnswersetOfOrder]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_GetAnswersetOfOrder]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetAnswerSet]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetAnswerSet]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_GetAnswerSet]
GO
/****** Object:  StoredProcedure [dbo].[usp_getAnswerForQuestionnare]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_getAnswerForQuestionnare]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_getAnswerForQuestionnare]
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteTblData]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DeleteTblData]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DeleteTblData]
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteQuestionnare]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DeleteQuestionnare]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DeleteQuestionnare]
GO
/****** Object:  StoredProcedure [dbo].[usp_ChangeOrderAction]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ChangeOrderAction]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_ChangeOrderAction]
GO
/****** Object:  StoredProcedure [dbo].[usp_AuthenticateUserUsingFacebook]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_AuthenticateUserUsingFacebook]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_AuthenticateUserUsingFacebook]
GO
/****** Object:  StoredProcedure [dbo].[usp_AuthenticateUser]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_AuthenticateUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_AuthenticateUser]
GO
/****** Object:  StoredProcedure [dbo].[usp_AddQustinnare]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_AddQustinnare]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_AddQustinnare]
GO
/****** Object:  StoredProcedure [dbo].[usp_AddQuestionnareToServiceOrder]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_AddQuestionnareToServiceOrder]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_AddQuestionnareToServiceOrder]
GO
/****** Object:  StoredProcedure [dbo].[usp_AddNewUser]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_AddNewUser]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_AddNewUser]
GO
/****** Object:  StoredProcedure [dbo].[usp_AddNewServiceProvider]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_AddNewServiceProvider]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_AddNewServiceProvider]
GO
/****** Object:  StoredProcedure [dbo].[usp_AddAnswerSet]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_AddAnswerSet]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_AddAnswerSet]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetQueryDetails]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetQueryDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetQueryDetails]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetProviderDetails]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetProviderDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetProviderDetails]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCustomerDetails]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetCustomerDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_GetCustomerDetails]
GO
/****** Object:  StoredProcedure [dbo].[SetWebQueries]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetWebQueries]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SetWebQueries]
GO
/****** Object:  StoredProcedure [dbo].[GetUserPassword]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetUserPassword]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetUserPassword]
GO
/****** Object:  StoredProcedure [dbo].[GetUserOrders]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetUserOrders]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetUserOrders]
GO
/****** Object:  StoredProcedure [dbo].[GetUserForUpdate]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetUserForUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetUserForUpdate]
GO
/****** Object:  StoredProcedure [dbo].[GetServicesListingsTopSix]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetServicesListingsTopSix]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetServicesListingsTopSix]
GO
/****** Object:  StoredProcedure [dbo].[GetServicesListings]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetServicesListings]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetServicesListings]
GO
/****** Object:  StoredProcedure [dbo].[GetServicesListForDropDown]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetServicesListForDropDown]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetServicesListForDropDown]
GO
/****** Object:  StoredProcedure [dbo].[GetServiceOrderListings]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetServiceOrderListings]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetServiceOrderListings]
GO
/****** Object:  Schema [servizee123]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'servizee123')
DROP SCHEMA [servizee123]
GO

DECLARE @RoleName sysname
set @RoleName = N'gd_execprocs'
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = @RoleName AND type = 'R')
IF @RoleName <> N'public' and (select is_fixed_role from sys.database_principals where name = @RoleName) = 0
BEGIN
	DECLARE @RoleMemberName sysname
	DECLARE Member_Cursor CURSOR FOR
	select [name]
	from sys.database_principals 
	where principal_id in ( 
		select member_principal_id
		from sys.database_role_members
		where role_principal_id in (
			select principal_id
			FROM sys.database_principals where [name] = @RoleName AND type = 'R'))

	OPEN Member_Cursor;

	FETCH NEXT FROM Member_Cursor
	into @RoleMemberName
	
	DECLARE @SQL NVARCHAR(4000)

	WHILE @@FETCH_STATUS = 0
	BEGIN
		
		SET @SQL = 'ALTER ROLE '+ QUOTENAME(@RoleName,'[') +' DROP MEMBER '+ QUOTENAME(@RoleMemberName,'[')
		EXEC(@SQL)
		
		FETCH NEXT FROM Member_Cursor
		into @RoleMemberName
	END;

	CLOSE Member_Cursor;
	DEALLOCATE Member_Cursor;
END
/****** Object:  DatabaseRole [gd_execprocs]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'gd_execprocs' AND type = 'R')
DROP ROLE [gd_execprocs]
GO
/****** Object:  User [servizee123]    Script Date: 02/05/18 12:38:41 PM ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'servizee123')
DROP USER [servizee123]
GO
/****** Object:  User [servizee123]    Script Date: 02/05/18 12:38:41 PM ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'servizee123')
CREATE USER [servizee123] FOR LOGIN [servizee123] WITH DEFAULT_SCHEMA=[servizee123]
GO
/****** Object:  DatabaseRole [gd_execprocs]    Script Date: 02/05/18 12:38:41 PM ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'gd_execprocs' AND type = 'R')
CREATE ROLE [gd_execprocs]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [servizee123]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [servizee123]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [servizee123]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [servizee123]
GO
ALTER ROLE [db_datareader] ADD MEMBER [servizee123]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [servizee123]
GO
/****** Object:  Schema [servizee123]    Script Date: 02/05/18 12:38:41 PM ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'servizee123')
EXEC sys.sp_executesql N'CREATE SCHEMA [servizee123]'

GO
/****** Object:  StoredProcedure [dbo].[GetServiceOrderListings]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetServiceOrderListings]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROC [dbo].[GetServiceOrderListings]

As
Begin
select SO.* , S.[Service_Name]
from
[dbo].[OK_ServiceOrder] SO
join
[dbo].[OK_Services] S
on 
SO.[ServiceOrder_Service_ID_FK] = S.Service_ID_Auto_PK
order by SO.[ServiceOrder_ID_Auto_PK] desc
End



' 
END
GO
/****** Object:  StoredProcedure [dbo].[GetServicesListForDropDown]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetServicesListForDropDown]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetServicesListForDropDown] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    SELECT [Service_ID_Auto_PK], [Service_Code], [Service_Name] FROM dbo.OK_Services WHERE Status = ''active''

END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[GetServicesListings]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetServicesListings]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetServicesListings] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    SELECT * FROM dbo.vwServicesListing 

END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[GetServicesListingsTopSix]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetServicesListingsTopSix]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
CREATE PROCEDURE [dbo].[GetServicesListingsTopSix] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    SELECT  * FROM dbo.vwServicesListing WHERE Status = ''active'' and Service_Type = ''hot''

END



' 
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserForUpdate]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetUserForUpdate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- =============================================
-- Author:		<Abhishek Khemariya>
-- Create date: <14-04-2016>
-- Description:	<Get Service Provider For Update>
-- =============================================
CREATE PROCEDURE [dbo].[GetUserForUpdate] 
	-- Add the parameters for the stored procedure here
	@U_U_id_pk bigint 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   select * from dbo.OK_User where User_ID_Auto_PK = @U_U_id_pk 
END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserOrders]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetUserOrders]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetUserOrders]
@Username nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    SELECT ''SRV'' + right(''000000'' + convert(varchar(10),O.ServiceOrder_ID_Auto_PK),7) TransId,
	   S.Service_Name, 
	   O.CreatedDate, 
	   O.ServiceOrder_PaymentAmount,  
	   O.ServiceOrder_Scheduled_Date_Time, 
	   O.ServiceOrder_TimeSlot,
	   O.Status
  FROM OK_ServiceOrder O INNER JOIN [dbo].[OK_User] U ON O.ServiceOrder_User_ID_FK = U.User_ID_Auto_PK
  INNER JOIN [dbo].[OK_Services] S ON S.Service_ID_Auto_PK = O.ServiceOrder_Service_ID_FK 
  WHERE U.Username = @Username AND O.ServiceOrder_Stage >= 3

END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserPassword]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetUserPassword]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetUserPassword] 
@Username nvarchar(100)
AS
BEGIN
SELECT [User_FirstName] + '' '' + [User_LastName] FullName, [User_Password], [User_Email]  FROM [dbo].[OK_User] WHERE Username = @Username AND [Status] = ''active''
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[SetWebQueries]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SetWebQueries]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'








CREATE proc [dbo].[SetWebQueries]


@name nvarchar(100),
@email nvarchar(100),
@contact_no nvarchar(20),
@Q_address nvarchar(200),
@Q_City nvarchar(50),
@Q_State nvarchar(40),
@Q_Service_Id int ,
@Q_Comments nvarchar(1000),
@Q_CreatedDate datetime,
@Q_UpdatedDate datetime,
@Q_CreatedBy nvarchar(50),
@Q_UpdatedBy nvarchar(50),
@Q_status nvarchar(20),
@Q_Customer_Type nvarchar(30)

As

Begin
insert into  [dbo].[OK_WebQueries]
(
 Query_PersonName,
 Query_Email,
 Query_ContactNumber,
 Query_Address,
 Query_City,
 [Query_State],
 Query_Service_Id,
 Query_Comments,
 CreatedDate,
 UpdatedDate,
 CreatedBy,
 UpdatedBy,
 Status,
 Query_Customer_type 
)
values
(
@name,
@email,
@contact_no,
@Q_address,
@Q_City,
@Q_State,
@Q_Service_Id ,
@Q_Comments,
@Q_CreatedDate,
@Q_UpdatedDate,
@Q_CreatedBy,
@Q_UpdatedBy,
@Q_status,
@Q_Customer_Type
)
SELECT Query_ID_Auto_PK , Query_PersonName , Query_Email , Query_ContactNumber,[Query_Address],[Query_City],[Query_State],[dbo].[OK_Services].Service_Name , Query_Customer_type ,[Query_Comments]
 FROM
  [dbo].[OK_WebQueries] 
  left join
  [dbo].[OK_Services]
  on
  [dbo].[OK_WebQueries].Query_Service_Id = [dbo].[OK_Services].Service_ID_Auto_PK
  WHERE [dbo].[OK_WebQueries].CreatedDate IN (SELECT MAX(CreatedDate) FROM [dbo].[OK_WebQueries] where Query_PersonName=@name
  and Query_Email=@email and Query_ContactNumber=@contact_no)
End









' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCustomerDetails]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetCustomerDetails]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'













-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
CREATE PROCEDURE [dbo].[sp_GetCustomerDetails] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
   select U.* , S.[Service_Name] as Service
  from [dbo].[OK_User] U
  left join [dbo].[OK_Services] S
  on
  U.[Service_Id] = S.[Service_ID_Auto_PK]
	where [User_Type] = ''customer'' or [User_Type] = ''BOTH''   
	order by [User_ID_Auto_PK] desc
END












' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetProviderDetails]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetProviderDetails]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'












-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
CREATE PROCEDURE [dbo].[sp_GetProviderDetails] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  select U.* , S.[Service_Name] as Service
  from [dbo].[OK_User] U
  left join [dbo].[OK_Services] S
  on
  U.[Service_Id] = S.[Service_ID_Auto_PK]
where U.[User_Type] = ''provider'' or  U.[User_Type] = ''BOTH'' 
order by U.[User_ID_Auto_PK] desc
	
END











' 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetQueryDetails]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetQueryDetails]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'







-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
CREATE PROCEDURE [dbo].[sp_GetQueryDetails] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
   select [Query_ID_Auto_PK] , [Query_PersonName],[Query_Email] ,[Query_ContactNumber],[Query_Address],[Query_City],[Service_Name],[Query_Comments],[Query_Customer_type],[dbo].[OK_WebQueries].[CreatedDate],[dbo].[OK_WebQueries].Status
    from
    [dbo].[OK_WebQueries]
    left join
    [dbo].[OK_Services]
    on
    [dbo].[OK_WebQueries].[Query_Service_Id] = [dbo].[OK_Services].Service_ID_Auto_PK    
	order by Query_ID_Auto_PK desc
END






' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AddAnswerSet]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_AddAnswerSet]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
Create Proc [dbo].[usp_AddAnswerSet]

@S_id_pk int,
@Questionnare_id int,
@Answr_Desc nvarchar(500),
@created_date datetime,
@updated_date datetime,
@created_By nvarchar(10),
@Status nvarchar(20)

As

Begin
  insert into dbo.OK_AnswerSet (Service_ID_FK,Questionnare_ID_FK,AnswerDesc,CreatedDate,UpdatedDate,CreatedBy,UpdatedBy,Status)
  values (@S_id_pk,@Questionnare_id,@Answr_Desc,@created_date,@updated_date,@created_By,@created_By,@Status)
   
  select AnswerSet_ID_Auto_PK from dbo.OK_AnswerSet where AnswerDesc = @Answr_Desc and CreatedDate = @created_date
  
End
' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AddNewServiceProvider]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_AddNewServiceProvider]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'













CREATE proc [dbo].[usp_AddNewServiceProvider]


@U_U_name nvarchar(100),
@U_fname nvarchar(100),
@U_lname nvarchar(100),
@U_email nvarchar(100),
@U_password nvarchar(20),
@U_contact1 nvarchar(20),
@U_B_name nvarchar(100)=null,
@U_pincode nvarchar (10)=null,
@U_landmark nvarchar(100)=null,
@U_city nvarchar(100),
@U_createdBy nvarchar(50),
@U_updatedBy nvarchar(50),
@U_createddate datetime,
@U_updateddate datetime,
@U_status nvarchar(20),
@U_u_type nvarchar(10),
@U_Service_Id nvarchar(50) = null,
@U_Service_Description nvarchar(max)=null
As

Begin
if exists(select 1 from [dbo].[OK_User] where [Username] = @U_U_name)
begin
select ''Username already exist'' as message
 end
else
begin
insert into  [dbo].[OK_User]
(
 Username,
 User_FirstName,
 User_LastName,
 User_Email,
 User_Password,
 User_Contact1,
 User_BuildingName,
 User_PinCode,
 User_LandMark,
 User_City,
 CreatedBy,
 UpdatedBy,
 CreatedDate,
 UpdatedDate,
 Status,
 User_Type,
 Service_Id,
 Service_Descrition
)
values
(
@U_U_name,
@U_fname,
@U_lname,
@U_email,
@U_password,
@U_contact1,
@U_B_name,
@U_pincode,
@U_landmark,
@U_city,
@U_createdBy,
@U_updatedBy,
@U_createddate,
@U_updateddate,
@U_status,
@U_u_type,
@U_Service_Id,
@U_Service_Description
)
select @@IDENTITY
end
End







' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AddNewUser]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_AddNewUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE proc [dbo].[usp_AddNewUser]


@U_U_name nvarchar(100),
@U_fname nvarchar(100),
@U_lname nvarchar(100),
@U_email nvarchar(100),
@U_password nvarchar(20),
@U_contact1 nvarchar(20),
@U_B_number nvarchar(10),
@U_B_name nvarchar(100),
@U_pincode nvarchar (10),
@U_landmark nvarchar(100),
@U_city nvarchar(100),
@U_type nvarchar(10),
@U_loc_lat nvarchar(20)=null,
@U_loc_long nvarchar(20)=null,
@U_createdBy nvarchar(50),
@U_updatedBy nvarchar(50),
@U_createddate datetime,
@U_updateddate datetime,
@U_status nvarchar(20),
@U_Service_Id nvarchar(50) = null,
@U_Service_Description nvarchar(500)=null

As

Begin
if exists(select 1 from [dbo].[OK_User] where [Username] = @U_U_name and ([User_Type] = ''BOTH'' OR [User_Type] = @U_type))
begin
select ''Username already exist'' as message
return
end

if exists(select 1 from [dbo].[OK_User] where [Username] = @U_U_name)
begin
if(@U_type = ''CUSTOMER'')
	update dbo.OK_User set User_Type = ''BOTH'' , [User_BuildingFlatNumber]=@U_B_number , [User_BuildingName] = @U_B_name ,[User_LandMark] =@U_landmark  ,[User_PinCode] = @U_pincode ,[User_City] = @U_city WHERE [Username] = @U_U_name
else
	update dbo.OK_User set User_Type = ''BOTH'', Service_Id = @U_Service_Id, Service_Descrition = @U_Service_Description WHERE [Username] = @U_U_name

SELECT User_ID_Auto_PK,User_FirstName,User_LastName,User_Email,User_Contact1,Username,User_Type , Status   FROM   [dbo].[OK_User]   WHERE Username = @U_U_name;
end
else
begin
insert into  [dbo].[OK_User]
(
 Username,
 User_FirstName,
 User_LastName,
 User_Email,
 User_Password,
 User_Contact1, 
 User_BuildingFlatNumber,
 User_BuildingName,
 User_PinCode,
 User_LandMark,
 User_City, 
 User_Type,
 User_location_LAT,
 User_location_LONG,
 CreatedBy,
 UpdatedBy,
 CreatedDate,
 UpdatedDate,
 Status,
 Service_Id,
 Service_Descrition
 
)
values
(
@U_U_name,
@U_fname,
@U_lname,
@U_email,
@U_password,
@U_contact1,
@U_B_number,
@U_B_name,
@U_pincode,
@U_landmark,
@U_city,
@U_type,
@U_loc_lat,
@U_loc_long,
@U_createdBy,
@U_updatedBy,
@U_createddate,
@U_updateddate,
@U_status,
@U_Service_Id,
@U_Service_Description
)
SELECT User_ID_Auto_PK,User_FirstName,User_LastName,User_Email,User_Contact1,Username,User_Type , Status   FROM   [dbo].[OK_User]   WHERE Username = @U_U_name and User_Password = @U_password and User_Contact1 = @U_contact1 and Status = @U_status;
end
End




' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AddQuestionnareToServiceOrder]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_AddQuestionnareToServiceOrder]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROC [dbo].[usp_AddQuestionnareToServiceOrder]

@SO_id int,
@q_id int,
@S_id int


As

Begin
  update [dbo].[OK_ServiceOrder] set [ServiceOrder_QuestionnareID] = @q_id where [ServiceOrder_ID_Auto_PK] = @SO_id and [ServiceOrder_Service_ID_FK] =@S_id
  
End
' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AddQustinnare]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_AddQustinnare]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
Create Proc [dbo].[usp_AddQustinnare]

@S_id_pk int,
@Question_Desc nvarchar(500),
@Answr_Type nvarchar(5),
@created_date datetime,
@updated_date datetime,
@created_By nvarchar(10),
@Status nvarchar(20)

As

Begin
  insert into dbo.OK_Questionnare (Service_ID_FK,QuestionDesc,AnswerType,CreatedDate,UpdatedDate,CreatedBy,UpdatedBy,Status)
  values (@S_id_pk,@Question_Desc,@Answr_Type,@created_date,@updated_date,@created_By,@created_By,@Status)
  
  select Questionnare_ID_Auto_PK from dbo.OK_Questionnare where QuestionDesc=@Question_Desc and CreatedDate = @created_date
  
End
' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AuthenticateUser]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_AuthenticateUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[usp_AuthenticateUser]
(
	@user_id nvarchar(50),
	@user_password nvarchar(50)

)
AS
BEGIN
	
	SET NOCOUNT ON;
		
		if exists(select ''1'' from [dbo].[OK_User] where Username = @user_id)
		begin
			if exists(select ''1'' from [dbo].[OK_User] where Username = @user_id and User_Password=@user_password)
			begin				
				if exists(select ''1'' from [dbo].[OK_User] where Username = @user_id and User_Password=@user_password and Status=''active'' and User_Type != ''PROVIDER'')
				begin				
					select User_ID_Auto_PK,User_FirstName,User_LastName,User_Email,User_Contact1,Username,User_Type , Status from [dbo].[OK_User] where Username =@user_id and User_Password=@user_password 
				end
				else
				begin
					select ''Inactive account, Please contact to Admin to activate your account.'' as errorMessage
				end
			end
			else
			begin
				select ''Invalid password'' as errorMessage
			end
		end
		else
		begin
			select ''Invalid Email id'' as errorMessage
		end  
	  
END




' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_AuthenticateUserUsingFacebook]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_AuthenticateUserUsingFacebook]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'





CREATE PROCEDURE [dbo].[usp_AuthenticateUserUsingFacebook]
(
	@U_U_name nvarchar(100),
	@U_fname nvarchar(100),	
	@U_email nvarchar(100),	
	@U_type nvarchar(10),	
	@U_createdBy nvarchar(50),
	@U_updatedBy nvarchar(50),
	@U_createddate datetime,
	@U_updateddate datetime,
	@U_status nvarchar(20)
	

)
AS
BEGIN
	
	SET NOCOUNT ON;
		
		if exists(select ''1'' from [dbo].[OK_User] where Username = @U_U_name)
		begin						
			select User_ID_Auto_PK,User_FirstName,User_LastName,User_Email,User_Contact1,Username,User_Type , Status from [dbo].[OK_User] where Username =@U_U_name 
		end
		else
		begin
			insert into  [dbo].[OK_User] (Username,User_FirstName,User_Email,[User_Contact1],User_Type,CreatedBy,UpdatedBy,CreatedDate,UpdatedDate,
            Status)
            values (@U_U_name,@U_fname,@U_email,'''',@U_type,@U_createdBy,@U_updatedBy,@U_createddate,@U_updateddate,@U_status)

			select User_ID_Auto_PK,User_FirstName,User_LastName,User_Email,User_Contact1,Username,User_Type , Status from [dbo].[OK_User] where Username =@U_U_name 
		end  
	  
END






' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ChangeOrderAction]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ChangeOrderAction]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'







CREATE proc [dbo].[usp_ChangeOrderAction]
@action nvarchar(20),
@id_auto_pk int

as

 
  
  begin
       if exists(select ''1'' from [dbo].[OK_ServiceOrder] where [ServiceOrder_ID_Auto_PK] =@id_auto_pk)
		begin
			update [dbo].[OK_ServiceOrder] set [Status]=@action where [ServiceOrder_ID_Auto_PK] =@id_auto_pk
			select ''1'' as message
			return		
		end	
 
end













' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteQuestionnare]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DeleteQuestionnare]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE proc [dbo].[usp_DeleteQuestionnare]
@S_id_auto_pk int,
@Q_id_auto_pk int

as
begin
 
  if exists(select ''1'' from [dbo].[OK_Questionnare] where [Questionnare_ID_Auto_PK] =@Q_id_auto_pk and [Service_ID_FK] =@S_id_auto_pk)
		begin
		    -- Deleting Questions fro Service---
			delete from  [dbo].[OK_Questionnare] where [Questionnare_ID_Auto_PK] =@Q_id_auto_pk and [Service_ID_FK] =@S_id_auto_pk

			----Deleting Answers for that Question
			if exists(select ''1'' from [dbo].[OK_AnswerSet] where [Questionnare_ID_FK] = @Q_id_auto_pk and [Service_ID_FK] =@S_id_auto_pk)
			begin
			  delete from [dbo].[OK_AnswerSet] where [Questionnare_ID_FK] = @Q_id_auto_pk and [Service_ID_FK] =@S_id_auto_pk
			End

			select ''success'' as message
			return			
		end	   
end

' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteTblData]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DeleteTblData]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE proc [dbo].[usp_DeleteTblData]
@tbl_name nvarchar(30),
@id_auto_pk bigint

as
begin
 if(@tbl_name=''user'')
 begin
  if exists(select ''1'' from [dbo].[OK_User] where [User_ID_Auto_PK] =@id_auto_pk)
		begin
			delete from [dbo].[OK_User] where [User_ID_Auto_PK] =@id_auto_pk 
			select ''success'' as message
			return			
		end
		
  end
  if(@tbl_name = ''query'')
  begin
	  if exists(select ''1'' from [dbo].[OK_WebQueries] where [Query_ID_Auto_PK] =@id_auto_pk)
		begin
			delete from [dbo].[OK_WebQueries] where [Query_ID_Auto_PK]=@id_auto_pk
			select ''success'' as message
			return				
		end			
  end
  if(@tbl_name =''service'')
  begin
       if exists(select ''1'' from [dbo].[OK_Services] where [Service_ID_Auto_PK] =@id_auto_pk)
		begin
		    delete from [dbo].[OK_ServiceOrderAnswers] where [Service_ID_FK] = @id_auto_pk
			delete from [dbo].[OK_ServiceOrder] where [ServiceOrder_Service_ID_FK] = @id_auto_pk
			delete from [dbo].[OK_AnswerSet] where [Service_ID_FK] = @id_auto_pk
			delete from [dbo].[OK_Questionnare] where [Service_ID_FK] = @id_auto_pk
			delete from [dbo].[OK_WebQueries] where [Query_Service_Id]=@id_auto_pk
			delete from [dbo].[OK_Services] where [Service_ID_Auto_PK]=@id_auto_pk 
			
			select ''success'' as message
			return
		end		
  end
  if(@tbl_name =''service-provider'')
  begin
	   if exists(select ''1'' from [dbo].[OK_ServiceProvider] where [Provider_ID_Auto_PK] =@id_auto_pk)
		begin
			delete from [dbo].[OK_ServiceProvider]  where [Provider_ID_Auto_PK]=@id_auto_pk 
			select ''success'' as message
			return
		end		
  end
  if(@tbl_name=''service-provider-map'')
  begin
	   if exists(select ''1'' from [dbo].[OK_SERVICES_PROVIDER_MAP] where [OK_ServiceProviderMap_ID_Auto_PK] =@id_auto_pk )
		begin
			delete from [dbo].[OK_SERVICES_PROVIDER_MAP]  where [OK_ServiceProviderMap_ID_Auto_PK]=@id_auto_pk 
			select ''success'' as message
			return
		end		
  end 
  if(@tbl_name=''category'')
  begin
       if exists(select ''1'' from [dbo].[OK_Categories] where [Category_ID_Auto_PK] =@id_auto_pk)
		begin
			delete from [dbo].[OK_Categories] where [Category_ID_Auto_PK]=@id_auto_pk 
			select ''success'' as message
			return
		end		
  end

   if(@tbl_name=''serviceOrder'')
  begin
       if exists(select ''1''  from [dbo].[OK_ServiceOrder] where [ServiceOrder_ID_Auto_PK] =@id_auto_pk)
		begin
			delete from [dbo].[OK_ServiceOrder] where [ServiceOrder_ID_Auto_PK] = @id_auto_pk
			delete from [dbo].[OK_ServiceOrderAnswers] where [ServiceOrder_ID_FK] = @id_auto_pk
			select ''success'' as message
			return
		end		
  end
end








' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_getAnswerForQuestionnare]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_getAnswerForQuestionnare]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROC [dbo].[usp_getAnswerForQuestionnare]

@Q_id int

AS

BEGIN  
    select [AnswerSet_ID_Auto_PK] , [AnswerDesc] from [dbo].[OK_AnswerSet] where [Questionnare_ID_FK] = @Q_id  
END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetAnswerSet]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetAnswerSet]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
create proc [dbo].[usp_GetAnswerSet]

@S_id int,
@Q_id int

As

Begin
 select AnswerSet_ID_Auto_PK , AnswerDesc  from dbo.OK_AnswerSet where Service_ID_FK=@S_id and Questionnare_ID_FK  = @Q_id and Status = ''Active''
  
End
' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetAnswersetOfOrder]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetAnswersetOfOrder]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROC [dbo].[usp_GetAnswersetOfOrder]
@id_auto_pk int,
@q_id int 
As
Begin
select * from [dbo].[OK_ServiceOrderAnswers] where [ServiceOrder_ID_FK] = @id_auto_pk and [Questionnare_ID_FK] = @q_id
End' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetBaseFareForDropDown]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetBaseFareForDropDown]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[usp_GetBaseFareForDropDown] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    SELECT [BaseFare_ID_Auto_PK], [BaseFare_Desc],[Base_Fare]  FROM [dbo].[OK_Services_BaseFare] WHERE Status = ''active''

END







' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetCategoriesListForDropDown]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetCategoriesListForDropDown]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[usp_GetCategoriesListForDropDown] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    SELECT [Category_ID_Auto_PK] ,[Category_Code] ,[Category_Name]  FROM [dbo].[OK_Categories] WHERE Status = ''active''

END






' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetCategoriesListings]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetCategoriesListings]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[usp_GetCategoriesListings] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    SELECT * FROM [dbo].[vwCategoriesListing] 

END



' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetCategory]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetCategory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'





CREATE PROCEDURE [dbo].[usp_GetCategory] 
@C_id_auto_pk int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    SELECT * FROM [dbo].[OK_Categories]  where [Category_ID_Auto_PK] = @C_id_auto_pk

END










' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetNetBankingList]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetNetBankingList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROC [dbo].[usp_GetNetBankingList]

AS

Begin
  select * from [dbo].[Net_Banking_List] where [Status]=''Active''
End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetQuestionnare]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetQuestionnare]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROC [dbo].[usp_GetQuestionnare]

@S_id int 

AS

BEGIN
  if exists(select 1 from dbo.OK_Questionnare where Service_ID_FK =  @S_id)
  Begin
    select Questionnare_ID_Auto_PK , QuestionDesc ,AnswerType from dbo.OK_Questionnare where Service_ID_FK = @S_id
  End
  else
  Begin
   select ''There is no Questioonare For This Service'' as message
  End
END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetQuestionnareDetails]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetQuestionnareDetails]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE PROC [dbo].[usp_GetQuestionnareDetails]

@S_id int ,
@Q_id int

AS

BEGIN
  if exists(select 1 from dbo.OK_Questionnare where Service_ID_FK =  @S_id and [Questionnare_ID_Auto_PK] = @Q_id)
  Begin
    select * from dbo.OK_Questionnare where Service_ID_FK = @S_id and [Questionnare_ID_Auto_PK] = @Q_id
  End
  else
  Begin
   select ''There is no Questioonare For This Service'' as message
  End
END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetQuestionnareForOrder]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetQuestionnareForOrder]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROC [dbo].[usp_GetQuestionnareForOrder]
@id_auto_pk int
As
Begin
select [Questionnare_ID_FK] ,[QuestionDesc] from 
[dbo].[OK_ServiceOrderAnswers] 
join
[dbo].[OK_Questionnare]
on
[dbo].[OK_Questionnare].Questionnare_ID_Auto_PK = [dbo].[OK_ServiceOrderAnswers].Questionnare_ID_FK
where [ServiceOrder_ID_FK] = @id_auto_pk
End' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetQuestions]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetQuestions]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
create proc [dbo].[usp_GetQuestions]

@S_id int

As

Begin
 select Questionnare_ID_Auto_PK , QuestionDesc , AnswerType from dbo.OK_Questionnare where Service_ID_FK=@S_id and Status = ''Active''
  
End
' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetService]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetService]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[usp_GetService] 
@S_id_auto_pk int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    SELECT * FROM [dbo].[OK_Services] where Service_ID_Auto_PK= @S_id_auto_pk

END







' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetServicesList]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetServicesList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE PROCEDURE [dbo].[usp_GetServicesList] 

AS
BEGIN	
		SELECT * FROM dbo.vwServicesListing 	
END







' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetServicesListForWebService]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetServicesListForWebService]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE PROCEDURE [dbo].[usp_GetServicesListForWebService] 
@U_name nvarchar(100) = null
AS
BEGIN
	SELECT * FROM dbo.vwServicesListing
	--if exists(select 1 from [dbo].[OK_User] where [Username] = @U_name or [Username] = '''' or [Username] = null)
	--begin
	--	SELECT * FROM dbo.vwServicesListing 
	--end
 --   else
	--begin
	--	select ''Username is not valid'' as message
	--end
END






' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetServicesListingsOnSearch]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetServicesListingsOnSearch]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'Create PROCEDURE [dbo].[usp_GetServicesListingsOnSearch] 
@search_text nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
   SELECT * FROM dbo.vwServicesListing WHERE Service_Name  LIKE ''%''+@search_text+''%'' and Status=''active''

END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetSliderImage]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetSliderImage]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROC [dbo].[usp_GetSliderImage]

AS

Begin
  select * from [dbo].[OK_Slider_Image] where [Status]=''Active''
End
' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_getUserDetails]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_getUserDetails]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE PROCEDURE [dbo].[usp_getUserDetails]
(	
	@U_U_name nvarchar(50),
	@U_type nvarchar(10)
)
AS
BEGIN
	
	SET NOCOUNT ON;
	if(@U_U_name != '''')
	begin
		select User_FirstName,User_LastName ,User_Email , User_Contact1 , User_BuildingFlatNumber ,User_BuildingName
		,User_Area,User_LandMark , User_City ,User_State , Status
		 from [dbo].[OK_User] U where U.Username=@U_U_name and User_Type = @U_type and Status =''active''			
		
	end
	else
	begin
		select ''Invalid Credential.'' as errorMessage
	end

END



' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ManageServiceType]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ManageServiceType]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE proc [dbo].[usp_ManageServiceType]
@tbl_name nvarchar(30),
@id_auto_pk bigint

as
begin
 
  if(@tbl_name =''service'')
  begin
       if exists(select ''1'' from [dbo].[OK_Services] where [Service_ID_Auto_PK] =@id_auto_pk and Status=''active'' and [Service_Type] = ''hot'')
		begin
			update [dbo].[OK_Services] set [Service_Type]=''normal'' where [Service_ID_Auto_PK]=@id_auto_pk and Status=''active'' and [Service_Type] = ''hot''
			select ''0'' as message
			return
		end
		else
		begin
			update [dbo].[OK_Services] set [Service_Type]=''hot'' where [Service_ID_Auto_PK]=@id_auto_pk and Status=''active'' and [Service_Type] = ''normal''
			select ''1'' as message
			return
		end	
  end
end







' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_ManageStatus]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_ManageStatus]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create proc [dbo].[usp_ManageStatus]
@tbl_name nvarchar(30),
@id_auto_pk bigint

as
begin
 if(@tbl_name=''user'')
 begin
  if exists(select ''1'' from [dbo].[OK_User] where [User_ID_Auto_PK] =@id_auto_pk and Status=''active'')
		begin
			update [dbo].[OK_User] set[Status]=''inactive'' where [User_ID_Auto_PK] =@id_auto_pk and Status=''active''
			select ''0'' as message
			return
		end
		else
		begin
			update [dbo].[OK_User] set[Status]=''active'' where [User_ID_Auto_PK] =@id_auto_pk and Status=''inactive''
			select ''1'' as message
			return
		end	
  end
  if(@tbl_name = ''query'')
  begin
	  if exists(select ''1'' from [dbo].[OK_WebQueries] where [Query_ID_Auto_PK] =@id_auto_pk and Status=''active'')
		begin
			update [dbo].[OK_WebQueries] set[Status]=''inactive'' where [Query_ID_Auto_PK]=@id_auto_pk and Status=''active''
			select ''0'' as message
			return
		end
		else
		begin
			update [dbo].[OK_WebQueries] set[Status]=''active'' where [Query_ID_Auto_PK]=@id_auto_pk and Status=''inactive''
			select ''1'' as message
			return
		end	
  end
  if(@tbl_name =''service'')
  begin
       if exists(select ''1'' from [dbo].[OK_Services] where [Service_ID_Auto_PK] =@id_auto_pk and Status=''active'')
		begin
			update [dbo].[OK_Services] set[Status]=''inactive'' where [Service_ID_Auto_PK]=@id_auto_pk and Status=''active''
			select ''0'' as message
			return
		end
		else
		begin
			update [dbo].[OK_Services] set[Status]=''active'' where [Service_ID_Auto_PK]=@id_auto_pk and Status=''inactive''
			select ''1'' as message
			return
		end	
  end
  if(@tbl_name =''service-provider'')
  begin
	   if exists(select ''1'' from [dbo].[OK_ServiceProvider] where [Provider_ID_Auto_PK] =@id_auto_pk and Status=''active'')
		begin
			update [dbo].[OK_ServiceProvider] set[Status]=''inactive'' where [Provider_ID_Auto_PK]=@id_auto_pk and Status=''active''
			select ''0'' as message
			return
		end
		else
		begin
			update [dbo].[OK_ServiceProvider] set[Status]=''active'' where [Provider_ID_Auto_PK]=@id_auto_pk and Status=''inactive''
			select ''1'' as message
			return
		end	
  end
  if(@tbl_name=''service-provider-map'')
  begin
	   if exists(select ''1'' from [dbo].[OK_SERVICES_PROVIDER_MAP] where [OK_ServiceProviderMap_ID_Auto_PK] =@id_auto_pk and Status=''active'')
		begin
			update [dbo].[OK_SERVICES_PROVIDER_MAP] set[Status]=''inactive'' where [OK_ServiceProviderMap_ID_Auto_PK]=@id_auto_pk and Status=''active''
			select ''0'' as message
			return
		end
		else
		begin
			update [dbo].[OK_SERVICES_PROVIDER_MAP] set[Status]=''active'' where [OK_ServiceProviderMap_ID_Auto_PK]=@id_auto_pk and Status=''inactive''
			select ''1'' as message
			return
		end
  end 
  if(@tbl_name=''category'')
  begin
       if exists(select ''1'' from [dbo].[OK_Categories] where [Category_ID_Auto_PK] =@id_auto_pk and Status=''active'')
		begin
			update [dbo].[OK_Categories] set[Status]=''inactive'' where [Category_ID_Auto_PK]=@id_auto_pk and Status=''active''
			select ''0'' as message
			return
		end
		else
		begin
			update [dbo].[OK_Categories] set[Status]=''active'' where [Category_ID_Auto_PK]=@id_auto_pk and Status=''inactive''
			select ''1'' as message
			return
		end
  end
end


' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_SetCategories]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SetCategories]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


CREATE proc [dbo].[usp_SetCategories]


@C_name nvarchar(100),
@C_description nvarchar(200),
@C_CreatedDate datetime,
@C_UpdatedDate datetime,
@C_CreatedBy nvarchar(50),
@C_UpdatedBy nvarchar(50),
@C_status nvarchar(20)

As

Begin
if exists(select 1 from [dbo].[OK_Categories] where [Category_Name] =@C_name)
begin
  select ''Category Already Exist'' as message 
end
else
begin
insert into [dbo].[OK_Categories]
(
[Category_Name],
[Category_Description],
[CreatedDate],
[UpdatedDate],
[CreatedBy],
[UpdatedBy],
[Status]

)
values
(
@C_name,
@C_description,
@C_CreatedDate,
@C_UpdatedDate,
@C_CreatedBy,
@C_UpdatedBy,
@C_status
)
update [dbo].[OK_Categories] set [Category_Code] = (''CAT000''+convert(nvarchar(20),(select [Category_ID_Auto_PK] from [dbo].[OK_Categories] where [Category_Name] =@C_name)))
 where  [Category_ID_Auto_PK] = (select max([Category_ID_Auto_PK])from [dbo].[OK_Categories] where [Category_Name] =@C_name )

 select max([Category_ID_Auto_PK]) from [dbo].[OK_Categories] where [Category_Name] =@C_name
 end 
End















' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_SetCategoryImage]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SetCategoryImage]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'





CREATE proc [dbo].[usp_SetCategoryImage]

@C_id_auto_pk int,
@C_imageurl nvarchar(200),
@C_iconurl nvarchar(200)

As

Begin


update [dbo].[OK_Categories] set [Category_IconUrl] =@C_iconurl , [Category_ImageUrl] = @C_imageurl where [Category_ID_Auto_PK] = @C_id_auto_pk

 select [Category_Name] from [dbo].[OK_Categories] where [Category_ID_Auto_PK] = @C_id_auto_pk
  
End















' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_SetServiceImage]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SetServiceImage]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE proc [dbo].[usp_SetServiceImage]

@S_id_auto_pk int,
@S_imageurl nvarchar(200),
@S_iconurl nvarchar(200)

As

Begin


update [dbo].[OK_Services] set [Service_IconUrl] =@S_iconurl , [Service_ImageUrl] = @S_imageurl where [Service_ID_Auto_PK] = @S_id_auto_pk

 select [Service_Name] from [dbo].[OK_Services] where  [Service_ID_Auto_PK] = @S_id_auto_pk
  
End














' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_SetServiceOrderAnswerSet]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SetServiceOrderAnswerSet]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROC [dbo].[usp_SetServiceOrderAnswerSet]

@SO_id int,
@q_id int,
@S_id int,
@answer nvarchar(500),
@createdDate datetime,
@createdBy nvarchar(100),
@status nvarchar(20)

As

Begin
  insert into [dbo].[OK_ServiceOrderAnswers] ([Questionnare_ID_FK],[Service_ID_FK],[ServiceOrder_ID_FK],[AnswerDesc],[CreatedDate],
  [UpdatedDate],[CreatedBy],[UpdatedBy],[Status])
  values
  (@q_id,@S_id,@SO_id,@answer,@createdDate,@createdDate,@createdBy,@createdBy,@status)
  
End' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_SetServices]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SetServices]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'














CREATE proc [dbo].[usp_SetServices]


@S_name nvarchar(100),
@S_cat_id_fk int,
@S_description nvarchar(200),
@S_CreatedDate datetime,
@S_UpdatedDate datetime,
@S_CreatedBy nvarchar(50),
@S_UpdatedBy nvarchar(50),
@S_status nvarchar(20),
@S_service_type nvarchar(20),
@S_isQuestionnare bit,
@S_baseFare int =null


As

Begin
if exists(select 1 from [dbo].[OK_Services] where [Service_Name] =@S_name)
begin
  select ''Service Already Exist'' as message 
end
else
begin
insert into [dbo].[OK_Services]
(
[Service_Name],
[Service_Category_ID_FK],
[Service_Description],
[CreatedDate],
[UpdatedDate],
[CreatedBy],
[UpdatedBy],
[Status],
[Service_Type],
[IsQuestionnare],
[BaseFare_ID_FK]
)
values
(
@S_name,
@S_cat_id_fk,
@S_description,
@S_CreatedDate,
@S_UpdatedDate,
@S_CreatedBy,
@S_UpdatedBy,
@S_status,
@S_service_type,
@S_isQuestionnare,
@S_baseFare
)

update [dbo].[OK_Services] set [Service_Code] = (''SERV'' + RIGHT(''00000''+CAST(@@IDENTITY AS VARCHAR(5)),5)) where [Service_ID_Auto_PK] = @@IDENTITY



 select max([Service_ID_Auto_PK]) from [dbo].[OK_Services] where [Service_Name] =@S_name
 end 
End

















' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_SetUserAnswer]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SetUserAnswer]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE Proc [dbo].[usp_SetUserAnswer]

@S_id_pk int,
@Questionnare_id int,
@Answr_Desc nvarchar(500),
@created_date datetime,
@created_By nvarchar(10),
@Status nvarchar(20)

As

Begin
  insert into [dbo].[OK_ServiceOrderAnswers] (Service_ID_FK,Questionnare_ID_FK,AnswerDesc,CreatedDate,UpdatedDate,CreatedBy,UpdatedBy,Status)
  values (@S_id_pk,@Questionnare_id,@Answr_Desc,@created_date,@created_date,@created_By,@created_By,@Status)
   
  select [ServiceOrderAnswers_ID_Auto_PK] from [dbo].[OK_ServiceOrderAnswers] where AnswerDesc = @Answr_Desc and CreatedDate = @created_date
  
End

' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_SheduleService]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SheduleService]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE proc [dbo].[usp_SheduleService]

@SO_s_id int,
@SO_q_id int = null,
@SO_shedule_date datetime,
@SO_status nvarchar(20),
@SO_createddate datetime,
@SO_createdby nvarchar(100),
@SO_updatedby nvarchar(100),
@SO_updateddate datetime,
@SO_stage int,
@username nvarchar(100),
@TimeSlot nvarchar(20) = null

as
begin
  declare @UserId bigint
  declare @BaseFare decimal(18, 2)
  select @BaseFare = B.[Base_Fare] 
    FROM [dbo].[OK_Services_BaseFare] B INNER JOIN [dbo].[OK_Services] S ON S.BaseFare_ID_FK = B.[BaseFare_ID_Auto_PK] WHERE S.[Service_ID_Auto_PK] = @SO_s_id
  if exists (select 1 from [dbo].[OK_User] where [Username]= @username)
   begin
      select @UserId = User_ID_Auto_PK from [dbo].[OK_User] where [Username]= @username
      insert into [dbo].[OK_ServiceOrder] 
	  (
	    [ServiceOrder_Service_ID_FK],
        [ServiceOrder_QuestionnareID],        
        [ServiceOrder_Scheduled_Date_Time],
        [ServiceOrder_IsUser],
		[ServiceOrder_User_ID_FK],
        [CreatedBy],
        [CreatedDate],
        [UpdatedBy],
        [UpdatedDate],
        [Status],
        [ServiceOrder_Stage],
		[ServiceOrder_PaymentAmount],
		[ServiceOrder_TimeSlot]
	  )
	  values
	  (
	    @SO_s_id,
	    @SO_q_id,
		@SO_shedule_date,
		1,
		@UserId,
		@SO_createdby,
		@SO_createddate,
		@SO_updatedby,
		@SO_updateddate,
		@SO_status,
		@SO_stage,
		@BaseFare,
		@TimeSlot
	  )
	  select @@IDENTITY ServiceOrder_ID_Auto_PK, @BaseFare BaseFare

	  select [User_BuildingFlatNumber],[User_BuildingName],[User_Area],[User_PinCode],[User_LandMark],[User_City],[User_Contact1],[Username], [User_FirstName] + '' '' + [User_LastName] FullName From [dbo].[OK_User]
	  WHERE [Username] = @username

	  --select max([ServiceOrder_ID_Auto_PK]) from [dbo].[OK_ServiceOrder] where [ServiceOrder_Service_ID_FK] =@SO_s_id and [ServiceOrder_Scheduled_Date_Time] =@SO_shedule_date
	  --and [ServiceOrder_Stage] = @SO_stage
   end
  else
   begin 
      insert into [dbo].[OK_ServiceOrder] 
	  (
	    [ServiceOrder_Service_ID_FK],
        [ServiceOrder_QuestionnareID],        
        [ServiceOrder_Scheduled_Date_Time],
        [ServiceOrder_IsUser],
        [CreatedBy],
        [CreatedDate],
        [UpdatedBy],
        [UpdatedDate],
        [Status],
        [ServiceOrder_Stage],
		[ServiceOrder_PaymentAmount],
		[ServiceOrder_TimeSlot]
	  )
	  values
	  (
	    @SO_s_id,
	    @SO_q_id,
		@SO_shedule_date,
		0,
		@SO_createdby,
		@SO_createddate,
		@SO_updatedby,
		@SO_updateddate,
		@SO_status,
		@SO_stage,
		@BaseFare,
		@TimeSlot
	  )
	  select @@IDENTITY ServiceOrder_ID_Auto_PK, @BaseFare BaseFare
	  --select max([ServiceOrder_ID_Auto_PK]) from [dbo].[OK_ServiceOrder] where [ServiceOrder_Service_ID_FK] =@SO_s_id and [ServiceOrder_Scheduled_Date_Time] =@SO_shedule_date
	  --and [ServiceOrder_Stage] = @SO_stage
   end
end

' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_SheduleService2]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SheduleService2]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE proc [dbo].[usp_SheduleService2]

@SO_id int,
@SO_stage int,
@username nvarchar(100),
@ContactPerson nvarchar(100),
@Mobile nvarchar(20),
@Add1 nvarchar(100),
@Add2 nvarchar(100) = NULL,
@LandMark nvarchar(50),
@PinCode nvarchar(10),
@Latitude nvarchar(10) = NULL,
@Longitude nvarchar(10) = NULL

AS
BEGIN
   IF EXISTS(SELECT 1 FROM [dbo].[OK_ServiceOrder] WHERE [ServiceOrder_ID_Auto_PK] = @SO_id AND Status = ''pending'' AND [ServiceOrder_Stage] = 1)
   BEGIN
		UPDATE [dbo].[OK_ServiceOrder] 
		   SET [ServiceOrder_ContantPerson] = @ContactPerson,
		       [ServiceOrder_ContactMobile] = @Mobile,
			   [ServiceOrder_Address1] = @Add1,
			   [ServiceOrder_Address2] = @Add2,
			   [ServiceOrder_LandMark] = @LandMark,
			   [ServiceOrder_PinCode] = @PinCode,
			   [ServiceOrder_LocationLat] = @Latitude,
			   [ServiceOrder_LocationLong] = @Longitude,
			   [ServiceOrder_Stage] = @SO_stage
		 WHERE [ServiceOrder_ID_Auto_PK] = @SO_id --AND Status = ''pending'' AND [ServiceOrder_Stage] = 1

		 SELECT ''0'', ''Success''
   END
   ELSE
   BEGIN
		SELECT ''1001'', ''Invalid Service Order Request''
   END
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_SheduleService3]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SheduleService3]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE proc [dbo].[usp_SheduleService3]

@SO_id int,
@SO_stage int,
@username nvarchar(100),
@PaymentRef nvarchar(100)

AS
BEGIN
   IF EXISTS(SELECT 1 FROM [dbo].[OK_ServiceOrder] WHERE [ServiceOrder_ID_Auto_PK] = @SO_id AND Status = ''pending'' AND [ServiceOrder_Stage] = 2)
   BEGIN
		UPDATE [dbo].[OK_ServiceOrder] 
		   SET [Service_IsPaid] = 1,
		       [ServiceOrder_PaymentMode] = ''CC/DC/NB'',
			   [ServiceOrder_Stage] = @SO_stage,
			   [Status] = ''CONFIRMED''
		 WHERE [ServiceOrder_ID_Auto_PK] = @SO_id

		 SELECT ''0'', ''Success''
   END
   ELSE
   BEGIN
		SELECT ''1001'', ''Invalid Service Order Request''
   END
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateCategory]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_UpdateCategory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'




CREATE proc [dbo].[usp_UpdateCategory]

@C_id_auto_pk int,
@C_name nvarchar(100),
@C_description nvarchar(200),
@C_UpdatedDate datetime,
@C_UpdatedBy nvarchar(50)

As

Begin

begin
update [dbo].[OK_Categories] set [Category_Name]=@C_name , [Category_Description] = @C_description , 
 [UpdatedDate] = @C_UpdatedDate , [UpdatedBy] =@C_UpdatedBy 
where [Category_ID_Auto_PK] = @C_id_auto_pk

 select max([Category_ID_Auto_PK]) from [dbo].[OK_Categories]  where [Category_Name] =@C_name
 end 
End















' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateServiceProvider]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_UpdateServiceProvider]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



CREATE proc [dbo].[usp_UpdateServiceProvider]


@U_U_name nvarchar(100),
@U_fname nvarchar(100),
@U_lname nvarchar(100),
@U_email nvarchar(100),
@U_password nvarchar(20),
@U_contact1 nvarchar(20),
@U_B_name nvarchar(100)=null,
@U_pincode nvarchar (10)=null,
@U_landmark nvarchar(100)=null,
@U_city nvarchar(100),
@U_createdBy nvarchar(50),
@U_updatedBy nvarchar(50),
@U_createddate datetime,
@U_updateddate datetime,
@U_status nvarchar(20),
@U_u_type nvarchar(10),
@U_Service_Id nvarchar(50) = null,
@U_Service_Description nvarchar(max)=null,
@U_u_id bigint
As

Begin

update[dbo].[OK_User] set

 Username = @U_U_name,
 User_FirstName = @U_fname ,
 User_LastName =@U_lname,
 User_Email = @U_email,
 User_Password = @U_password,
 User_Contact1 = @U_contact1,
 User_BuildingName = @U_B_name,
 User_PinCode = @U_pincode,
 User_LandMark = @U_landmark,
 User_City = @U_city,
 UpdatedBy = @U_updatedBy, 
 UpdatedDate = @U_updateddate,
 Status = @U_status,
 User_Type = @U_u_type,
 Service_Id = @U_Service_Id,
 Service_Descrition = @U_Service_Description

 where [User_ID_Auto_PK] = @U_u_id

select @@IDENTITY

End






' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateServices]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_UpdateServices]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'












CREATE proc [dbo].[usp_UpdateServices]

@S_id_auto_pk int,
@S_name nvarchar(100),
@S_cat_id_fk int,
@S_description nvarchar(200),
@S_UpdatedDate datetime,
@S_UpdatedBy nvarchar(50),
@S_baseFare int=null

As

Begin

begin
update [dbo].[OK_Services] set [Service_Name]=@S_name , [Service_Description] = @S_description , [Service_Category_ID_FK] = @S_cat_id_fk,
 [UpdatedDate] = @S_UpdatedDate , [UpdatedBy] =@S_UpdatedBy ,[BaseFare_ID_FK] = @S_baseFare
where [Service_ID_Auto_PK] = @S_id_auto_pk

 select max([Service_ID_Auto_PK]) from [dbo].[OK_Services] where [Service_Name] =@S_name
 end 
End














' 
END
GO
/****** Object:  StoredProcedure [servizee123].[usp_ChangePassword]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[servizee123].[usp_ChangePassword]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Abhishek Khemariya>
-- Create date: <13-04-2016>
-- Description:	<For Changing Admin Password>
-- =============================================
CREATE PROCEDURE [servizee123].[usp_ChangePassword] 
	-- Add the parameters for the stored procedure here
	@o_pass nvarchar(20),
	@n_pass nvarchar(20),
	@uname nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if exists (select * from [dbo].[OK_User] where [Username] = @uname and [User_Password] = @o_pass and Status = ''active'' )
	begin
	  update [dbo].[OK_User] set [User_Password] = @n_pass where [User_Password] = @o_pass and [Username] = @uname and Status = ''active''
	  select ''1'' as message
	end
    
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[GetServiceRefNo]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetServiceRefNo]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[GetServiceRefNo]
(
	@ServiceOrderId int
)
RETURNS nvarchar
AS
BEGIN

    declare @refno nvarchar(20)
	SELECT @refno = ''OKTRN'' + RIGHT(''0000000''+CAST(@ServiceOrderId AS VARCHAR),9)

	-- Return the result of the function
	RETURN @refno

END
' 
END

GO
/****** Object:  Table [dbo].[FareType]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FareType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FareType](
	[FareType_ID_Auto_PK] [int] IDENTITY(1,1) NOT NULL,
	[FareType] [nvarchar](50) NULL,
 CONSTRAINT [PK_FareType] PRIMARY KEY CLUSTERED 
(
	[FareType_ID_Auto_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Net_Banking_List]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Net_Banking_List]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Net_Banking_List](
	[Net_Banking_List_ID_Auto_PK] [int] IDENTITY(1,1) NOT NULL,
	[Bank_Name] [nvarchar](200) NULL,
	[Bank_CID] [nvarchar](10) NULL,
	[Status] [nvarchar](20) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OK_AnswerSet]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OK_AnswerSet]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OK_AnswerSet](
	[AnswerSet_ID_Auto_PK] [int] IDENTITY(1,1) NOT NULL,
	[Questionnare_ID_FK] [int] NULL,
	[Service_ID_FK] [int] NULL,
	[AnswerDesc] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[UpdatedBy] [nvarchar](100) NULL,
	[Status] [nvarchar](20) NULL,
 CONSTRAINT [PK_OK_AnswerSet] PRIMARY KEY CLUSTERED 
(
	[AnswerSet_ID_Auto_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OK_Categories]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OK_Categories]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OK_Categories](
	[Category_ID_Auto_PK] [int] IDENTITY(1,1) NOT NULL,
	[Category_Code] [nvarchar](10) NULL,
	[Category_Name] [nvarchar](100) NOT NULL,
	[Category_Description] [nvarchar](200) NULL,
	[Category_IconUrl] [nvarchar](200) NULL,
	[Category_ImageUrl] [nvarchar](200) NULL,
	[Category_Parent_ID_FK] [int] NULL,
	[Category_IsParent] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[UpdatedBy] [nvarchar](100) NULL,
	[Status] [nvarchar](20) NULL,
 CONSTRAINT [PK_OK_Categories] PRIMARY KEY CLUSTERED 
(
	[Category_ID_Auto_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OK_PROVIDER_TYPE]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OK_PROVIDER_TYPE]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OK_PROVIDER_TYPE](
	[OK_Provider_Type] [nvarchar](10) NOT NULL,
	[OK_Provider_Desc] [nvarchar](100) NULL,
 CONSTRAINT [PK_OK_PROVIDER_TYPE] PRIMARY KEY CLUSTERED 
(
	[OK_Provider_Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OK_Questionnare]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OK_Questionnare]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OK_Questionnare](
	[Questionnare_ID_Auto_PK] [int] IDENTITY(1,1) NOT NULL,
	[Service_ID_FK] [int] NULL,
	[QuestionDesc] [nvarchar](500) NULL,
	[AnswerType] [nvarchar](5) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[UpdatedBy] [nvarchar](100) NULL,
	[Status] [nvarchar](20) NULL,
 CONSTRAINT [PK_OK_Questionnare] PRIMARY KEY CLUSTERED 
(
	[Questionnare_ID_Auto_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OK_ServiceOrder]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OK_ServiceOrder]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OK_ServiceOrder](
	[ServiceOrder_ID_Auto_PK] [int] IDENTITY(1,1) NOT NULL,
	[ServiceOrder_Service_ID_FK] [int] NULL,
	[ServiceOrder_QuestionnareID] [int] NULL,
	[ServiceOrder_Scheduled_Date_Time] [datetime] NULL,
	[ServiceOrder_IsUser] [bit] NULL,
	[ServiceOrder_User_ID_FK] [bigint] NULL,
	[ServiceOrder_ContantPerson] [nvarchar](100) NULL,
	[ServiceOrder_ContactMobile] [nvarchar](20) NULL,
	[ServiceOrder_Address1] [nvarchar](100) NULL,
	[ServiceOrder_Address2] [nvarchar](100) NULL,
	[ServiceOrder_LandMark] [nvarchar](50) NULL,
	[ServiceOrder_PinCode] [nvarchar](10) NULL,
	[ServiceOrder_LocationLat] [nvarchar](20) NULL,
	[ServiceOrder_LocationLong] [nvarchar](20) NULL,
	[ServiceOrder_PaymentMode] [nvarchar](10) NULL,
	[ServiceOrder_PaymentAmount] [decimal](18, 0) NULL,
	[ServiceOrder_PaymentReference] [nvarchar](100) NULL,
	[Service_IsPaid] [bit] NULL,
	[Service_Provider_ID_FK] [int] NULL,
	[ServiceOrder_Stage] [tinyint] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[Status] [nvarchar](20) NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[UpdatedBy] [nvarchar](100) NULL,
	[ServiceOrder_TimeSlot] [nvarchar](20) NULL,
 CONSTRAINT [PK_OK_ServiceOrder] PRIMARY KEY CLUSTERED 
(
	[ServiceOrder_ID_Auto_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OK_ServiceOrderAnswers]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OK_ServiceOrderAnswers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OK_ServiceOrderAnswers](
	[ServiceOrderAnswers_ID_Auto_PK] [int] IDENTITY(1,1) NOT NULL,
	[Questionnare_ID_FK] [int] NULL,
	[Service_ID_FK] [int] NULL,
	[ServiceOrder_ID_FK] [int] NULL,
	[AnswerDesc] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[UpdatedBy] [nvarchar](100) NULL,
	[Status] [nvarchar](20) NULL,
 CONSTRAINT [PK_OK_ServiceOrderAnswers] PRIMARY KEY CLUSTERED 
(
	[ServiceOrderAnswers_ID_Auto_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OK_ServiceProvider]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OK_ServiceProvider]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OK_ServiceProvider](
	[Provider_ID_Auto_PK] [int] IDENTITY(1,1) NOT NULL,
	[Provider_FirstName] [nvarchar](100) NULL,
	[Provider_LastName] [nvarchar](100) NULL,
	[Provider_ContactNumber1] [nvarchar](20) NOT NULL,
	[Provider_ContactNumber2] [nvarchar](20) NULL,
	[Provider_Type] [nvarchar](10) NOT NULL,
	[Provider_Parent_ID_FK] [int] NULL,
	[Provider_CompanyName] [nvarchar](100) NULL,
	[Provider_Address] [nvarchar](200) NULL,
	[Provider_Location_LAT] [nvarchar](20) NULL,
	[Provider_Location_LONG] [nvarchar](20) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[UpdatedBy] [nvarchar](100) NULL,
	[Status] [nvarchar](20) NULL,
 CONSTRAINT [PK_OK_ServiceProvider] PRIMARY KEY CLUSTERED 
(
	[Provider_ID_Auto_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OK_Services]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OK_Services]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OK_Services](
	[Service_ID_Auto_PK] [int] IDENTITY(1,1) NOT NULL,
	[Service_Code] [nvarchar](10) NULL,
	[Service_Category_ID_FK] [int] NOT NULL,
	[Service_Name] [nvarchar](100) NOT NULL,
	[Service_Description] [nvarchar](200) NULL,
	[Service_IconUrl] [nvarchar](200) NULL,
	[Service_ImageUrl] [nvarchar](200) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[Status] [nvarchar](20) NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[UpdatedBy] [nvarchar](100) NULL,
	[Service_Type] [nvarchar](20) NULL,
	[BaseFare_ID_FK] [int] NULL,
	[IsQuestionnare] [bit] NULL,
 CONSTRAINT [PK_OK_Services] PRIMARY KEY CLUSTERED 
(
	[Service_ID_Auto_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OK_Services_BaseFare]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OK_Services_BaseFare]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OK_Services_BaseFare](
	[BaseFare_ID_Auto_PK] [int] IDENTITY(1,1) NOT NULL,
	[BaseFare_Desc] [nvarchar](100) NULL,
	[Base_Fare] [decimal](18, 2) NOT NULL,
	[Base_FareType] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[Status] [nvarchar](20) NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[UpdatedBy] [nvarchar](100) NULL,
 CONSTRAINT [PK_OK_Services_BaseFare] PRIMARY KEY CLUSTERED 
(
	[BaseFare_ID_Auto_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OK_SERVICES_PROVIDER_MAP]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OK_SERVICES_PROVIDER_MAP]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OK_SERVICES_PROVIDER_MAP](
	[OK_ServiceProviderMap_ID_Auto_PK] [bigint] IDENTITY(1,1) NOT NULL,
	[OK_Service_ID_FK] [int] NOT NULL,
	[OK_Provider_ID_FK] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[UpdatedBy] [nvarchar](100) NULL,
	[Status] [nvarchar](20) NULL,
 CONSTRAINT [PK_OK_SERVICES_PROVIDER_MAP] PRIMARY KEY CLUSTERED 
(
	[OK_ServiceProviderMap_ID_Auto_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OK_Slider_Image]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OK_Slider_Image]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OK_Slider_Image](
	[SliderImage_ID_Auto_PK] [int] IDENTITY(1,1) NOT NULL,
	[SliderImage_ImageUrl] [nvarchar](200) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[UpdatedBy] [nvarchar](100) NULL,
	[Status] [nvarchar](20) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OK_User]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OK_User]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OK_User](
	[User_ID_Auto_PK] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[User_FirstName] [nvarchar](100) NULL,
	[User_LastName] [nvarchar](100) NULL,
	[User_Email] [nvarchar](100) NOT NULL,
	[User_Password] [nvarchar](20) NULL,
	[User_Contact1] [nvarchar](20) NOT NULL,
	[User_Contact2] [nvarchar](20) NULL,
	[User_BuildingFlatNumber] [nvarchar](10) NULL,
	[User_BuildingName] [nvarchar](100) NULL,
	[User_Area] [nvarchar](100) NULL,
	[User_PinCode] [nvarchar](10) NULL,
	[User_LandMark] [nvarchar](100) NULL,
	[User_City] [nvarchar](100) NULL,
	[User_State] [nvarchar](100) NULL,
	[User_Counrty] [nvarchar](100) NULL,
	[User_Type] [nvarchar](10) NULL,
	[User_location_LAT] [nvarchar](20) NULL,
	[User_location_LONG] [nvarchar](20) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[Status] [nvarchar](20) NULL,
	[Service_Id] [nvarchar](50) NULL,
	[Service_Descrition] [nvarchar](max) NULL,
 CONSTRAINT [PK_OK_User] PRIMARY KEY CLUSTERED 
(
	[User_ID_Auto_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OK_User_Types]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OK_User_Types]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OK_User_Types](
	[User_Type_Id] [nvarchar](10) NOT NULL,
	[User_Type_Desc] [nvarchar](100) NULL,
 CONSTRAINT [PK_User_Types] PRIMARY KEY CLUSTERED 
(
	[User_Type_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OK_WebQueries]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OK_WebQueries]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OK_WebQueries](
	[Query_ID_Auto_PK] [bigint] IDENTITY(1,1) NOT NULL,
	[Query_PersonName] [nvarchar](100) NOT NULL,
	[Query_Email] [nvarchar](100) NULL,
	[Query_ContactNumber] [nvarchar](20) NULL,
	[Query_Address] [nvarchar](200) NULL,
	[Query_City] [nvarchar](50) NULL,
	[Query_State] [nvarchar](30) NULL,
	[Query_Service_Id] [int] NOT NULL,
	[Query_Comments] [nvarchar](1000) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[UpdatedBy] [nvarchar](50) NULL,
	[Status] [nvarchar](20) NULL,
	[Query_Customer_type] [nvarchar](30) NULL,
 CONSTRAINT [PK_OK_WebQueries] PRIMARY KEY CLUSTERED 
(
	[Query_ID_Auto_PK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  View [dbo].[vwCategoriesListing]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vwCategoriesListing]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[vwCategoriesListing]
AS
SELECT [Category_ID_Auto_PK] ,[Category_Code] ,[Category_Name] ,[Category_Description] ,[Category_IconUrl] ,[Category_ImageUrl] ,[Status]
      from  [dbo].[OK_Categories]   




' 
GO
/****** Object:  View [dbo].[vwServicesListing]    Script Date: 02/05/18 12:38:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vwServicesListing]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[vwServicesListing]
AS
SELECT        dbo.OK_Services.Service_ID_Auto_PK, dbo.OK_Services.Service_Code, dbo.OK_Services.Service_Name, dbo.OK_Services.Service_Description, dbo.OK_Services.Service_IconUrl, 
                         dbo.OK_Services.Service_ImageUrl, dbo.OK_Services.Status, dbo.[OK_Services].Service_Type,dbo.OK_Categories.Category_Code, dbo.OK_Categories.Category_Name
FROM            dbo.OK_Services INNER JOIN
                         dbo.OK_Categories ON dbo.OK_Services.Service_Category_ID_FK = dbo.OK_Categories.Category_ID_Auto_PK


' 
GO
SET IDENTITY_INSERT [dbo].[FareType] ON 

GO
INSERT [dbo].[FareType] ([FareType_ID_Auto_PK], [FareType]) VALUES (1, N'Hourly')
GO
INSERT [dbo].[FareType] ([FareType_ID_Auto_PK], [FareType]) VALUES (2, N'Fixed')
GO
SET IDENTITY_INSERT [dbo].[FareType] OFF
GO
SET IDENTITY_INSERT [dbo].[Net_Banking_List] ON 

GO
INSERT [dbo].[Net_Banking_List] ([Net_Banking_List_ID_Auto_PK], [Bank_Name], [Bank_CID], [Status]) VALUES (1, N'Andhra Bank', N'CID016', N'ACTIVE')
GO
INSERT [dbo].[Net_Banking_List] ([Net_Banking_List_ID_Auto_PK], [Bank_Name], [Bank_CID], [Status]) VALUES (2, N'AXIS Bank', N'CID002', N'ACTIVE')
GO
INSERT [dbo].[Net_Banking_List] ([Net_Banking_List_ID_Auto_PK], [Bank_Name], [Bank_CID], [Status]) VALUES (3, N'Andhra Bank', N'CID016', N'ACTIVE')
GO
INSERT [dbo].[Net_Banking_List] ([Net_Banking_List_ID_Auto_PK], [Bank_Name], [Bank_CID], [Status]) VALUES (4, N'Axis Corporate Bank', N'CID080', N'ACTIVE')
GO
INSERT [dbo].[Net_Banking_List] ([Net_Banking_List_ID_Auto_PK], [Bank_Name], [Bank_CID], [Status]) VALUES (5, N'Bank Of Baroda', N'CID046', N'ACTIVE')
GO
INSERT [dbo].[Net_Banking_List] ([Net_Banking_List_ID_Auto_PK], [Bank_Name], [Bank_CID], [Status]) VALUES (6, N'Bank of Maharashtra', N'CID021', N'ACTIVE')
GO
INSERT [dbo].[Net_Banking_List] ([Net_Banking_List_ID_Auto_PK], [Bank_Name], [Bank_CID], [Status]) VALUES (7, N'Bank of India', N'CID019', N'ACTIVE')
GO
INSERT [dbo].[Net_Banking_List] ([Net_Banking_List_ID_Auto_PK], [Bank_Name], [Bank_CID], [Status]) VALUES (8, N'Canara Bank', N'CID051', N'ACTIVE')
GO
INSERT [dbo].[Net_Banking_List] ([Net_Banking_List_ID_Auto_PK], [Bank_Name], [Bank_CID], [Status]) VALUES (9, N'Catholic Syrian Bank', N'CID045', N'ACTIVE')
GO
INSERT [dbo].[Net_Banking_List] ([Net_Banking_List_ID_Auto_PK], [Bank_Name], [Bank_CID], [Status]) VALUES (10, N'Central Bank of India', N'CID023', N'ACTIVE')
GO
INSERT [dbo].[Net_Banking_List] ([Net_Banking_List_ID_Auto_PK], [Bank_Name], [Bank_CID], [Status]) VALUES (11, N'CITI Bank', N'CID003', N'ACTIVE')
GO
INSERT [dbo].[Net_Banking_List] ([Net_Banking_List_ID_Auto_PK], [Bank_Name], [Bank_CID], [Status]) VALUES (12, N'Corporation Bank', N'CID025', N'ACTIVE')
GO
INSERT [dbo].[Net_Banking_List] ([Net_Banking_List_ID_Auto_PK], [Bank_Name], [Bank_CID], [Status]) VALUES (13, N'City Union Bank', N'CID024', N'ACTIVE')
GO
INSERT [dbo].[Net_Banking_List] ([Net_Banking_List_ID_Auto_PK], [Bank_Name], [Bank_CID], [Status]) VALUES (14, N'DEUTSCHE Bank', N'CID006', N'ACTIVE')
GO
INSERT [dbo].[Net_Banking_List] ([Net_Banking_List_ID_Auto_PK], [Bank_Name], [Bank_CID], [Status]) VALUES (15, N'DCB Bank Personal', N'CID026', N'ACTIVE')
GO
INSERT [dbo].[Net_Banking_List] ([Net_Banking_List_ID_Auto_PK], [Bank_Name], [Bank_CID], [Status]) VALUES (16, N'Federal Bank', N'CID009', N'ACTIVE')
GO
INSERT [dbo].[Net_Banking_List] ([Net_Banking_List_ID_Auto_PK], [Bank_Name], [Bank_CID], [Status]) VALUES (17, N'HDFC Bank', N'CID010', N'ACTIVE')
GO
INSERT [dbo].[Net_Banking_List] ([Net_Banking_List_ID_Auto_PK], [Bank_Name], [Bank_CID], [Status]) VALUES (18, N'ICICI Bank', N'CID001', N'ACTIVE')
GO
INSERT [dbo].[Net_Banking_List] ([Net_Banking_List_ID_Auto_PK], [Bank_Name], [Bank_CID], [Status]) VALUES (19, N'ICICI Corporate Bank', N'CID050', N'ACTIVE')
GO
INSERT [dbo].[Net_Banking_List] ([Net_Banking_List_ID_Auto_PK], [Bank_Name], [Bank_CID], [Status]) VALUES (20, N'IDBI Bank', N'CID011', N'ACTIVE')
GO
INSERT [dbo].[Net_Banking_List] ([Net_Banking_List_ID_Auto_PK], [Bank_Name], [Bank_CID], [Status]) VALUES (21, N'Indian Bank', N'CID008', N'ACTIVE')
GO
INSERT [dbo].[Net_Banking_List] ([Net_Banking_List_ID_Auto_PK], [Bank_Name], [Bank_CID], [Status]) VALUES (22, N'Indian Overseas Bank', N'CID027', N'ACTIVE')
GO
INSERT [dbo].[Net_Banking_List] ([Net_Banking_List_ID_Auto_PK], [Bank_Name], [Bank_CID], [Status]) VALUES (23, N'Induslnd Bank', N'CID028', N'ACTIVE')
GO
INSERT [dbo].[Net_Banking_List] ([Net_Banking_List_ID_Auto_PK], [Bank_Name], [Bank_CID], [Status]) VALUES (24, N'ING VYSA', N'CID029', N'ACTIVE')
GO
INSERT [dbo].[Net_Banking_List] ([Net_Banking_List_ID_Auto_PK], [Bank_Name], [Bank_CID], [Status]) VALUES (25, N'Karnataka Bank', N'CID031', N'ACTIVE')
GO
INSERT [dbo].[Net_Banking_List] ([Net_Banking_List_ID_Auto_PK], [Bank_Name], [Bank_CID], [Status]) VALUES (26, N'Kotak Mahindra Bank', N'CID033', N'ACTIVE')
GO
INSERT [dbo].[Net_Banking_List] ([Net_Banking_List_ID_Auto_PK], [Bank_Name], [Bank_CID], [Status]) VALUES (27, N'Karur Vysya Bank', N'CID032', N'ACTIVE')
GO
INSERT [dbo].[Net_Banking_List] ([Net_Banking_List_ID_Auto_PK], [Bank_Name], [Bank_CID], [Status]) VALUES (28, N'PNB Retail', N'CID044', N'ACTIVE')
GO
INSERT [dbo].[Net_Banking_List] ([Net_Banking_List_ID_Auto_PK], [Bank_Name], [Bank_CID], [Status]) VALUES (29, N'PNB Corporate', N'CID036', N'ACTIVE')
GO
INSERT [dbo].[Net_Banking_List] ([Net_Banking_List_ID_Auto_PK], [Bank_Name], [Bank_CID], [Status]) VALUES (30, N'SBI Bank', N'CID005', N'ACTIVE')
GO
INSERT [dbo].[Net_Banking_List] ([Net_Banking_List_ID_Auto_PK], [Bank_Name], [Bank_CID], [Status]) VALUES (31, N'State Bank of Bikaner and Jaipur', N'CID013', N'ACTIVE')
GO
INSERT [dbo].[Net_Banking_List] ([Net_Banking_List_ID_Auto_PK], [Bank_Name], [Bank_CID], [Status]) VALUES (32, N'State Bank of Hyderabad', N'CID012', N'ACTIVE')
GO
INSERT [dbo].[Net_Banking_List] ([Net_Banking_List_ID_Auto_PK], [Bank_Name], [Bank_CID], [Status]) VALUES (33, N'State Bank of Mysore', N'CID014', N'ACTIVE')
GO
INSERT [dbo].[Net_Banking_List] ([Net_Banking_List_ID_Auto_PK], [Bank_Name], [Bank_CID], [Status]) VALUES (34, N'State Bank of Travancore', N'CID015', N'ACTIVE')
GO
INSERT [dbo].[Net_Banking_List] ([Net_Banking_List_ID_Auto_PK], [Bank_Name], [Bank_CID], [Status]) VALUES (35, N'State Bank of Patiala', N'CID043', N'ACTIVE')
GO
INSERT [dbo].[Net_Banking_List] ([Net_Banking_List_ID_Auto_PK], [Bank_Name], [Bank_CID], [Status]) VALUES (36, N'South Indian Bank', N'CID037', N'ACTIVE')
GO
INSERT [dbo].[Net_Banking_List] ([Net_Banking_List_ID_Auto_PK], [Bank_Name], [Bank_CID], [Status]) VALUES (37, N'Union Bank Of India', N'CID007', N'ACTIVE')
GO
INSERT [dbo].[Net_Banking_List] ([Net_Banking_List_ID_Auto_PK], [Bank_Name], [Bank_CID], [Status]) VALUES (38, N'United Bank of India', N'CID041', N'ACTIVE')
GO
INSERT [dbo].[Net_Banking_List] ([Net_Banking_List_ID_Auto_PK], [Bank_Name], [Bank_CID], [Status]) VALUES (39, N'Vijaya Bank', N'CID042', N'ACTIVE')
GO
INSERT [dbo].[Net_Banking_List] ([Net_Banking_List_ID_Auto_PK], [Bank_Name], [Bank_CID], [Status]) VALUES (40, N'YES Bank', N'CID004', N'ACTIVE')
GO
INSERT [dbo].[Net_Banking_List] ([Net_Banking_List_ID_Auto_PK], [Bank_Name], [Bank_CID], [Status]) VALUES (41, N'Cosmos Bank', N'CID053', N'ACTIVE')
GO
INSERT [dbo].[Net_Banking_List] ([Net_Banking_List_ID_Auto_PK], [Bank_Name], [Bank_CID], [Status]) VALUES (42, N'UCO Bank', N'CID070', N'ACTIVE')
GO
INSERT [dbo].[Net_Banking_List] ([Net_Banking_List_ID_Auto_PK], [Bank_Name], [Bank_CID], [Status]) VALUES (43, N'HSBC', N'CID090', N'ACTIVE')
GO
INSERT [dbo].[Net_Banking_List] ([Net_Banking_List_ID_Auto_PK], [Bank_Name], [Bank_CID], [Status]) VALUES (44, N'RBL', N'CID064', N'ACTIVE')
GO
INSERT [dbo].[Net_Banking_List] ([Net_Banking_List_ID_Auto_PK], [Bank_Name], [Bank_CID], [Status]) VALUES (45, N'SCB', N'CID038', N'ACTIVE')
GO
SET IDENTITY_INSERT [dbo].[Net_Banking_List] OFF
GO
SET IDENTITY_INSERT [dbo].[OK_Categories] ON 

GO
INSERT [dbo].[OK_Categories] ([Category_ID_Auto_PK], [Category_Code], [Category_Name], [Category_Description], [Category_IconUrl], [Category_ImageUrl], [Category_Parent_ID_FK], [Category_IsParent], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status]) VALUES (1, N'CAT0001', N'Commercial', N'These services are related to Commercial Services', NULL, NULL, NULL, 1, CAST(N'2015-12-22 00:00:00.000' AS DateTime), CAST(N'2016-01-19 00:13:47.363' AS DateTime), N'admin', N'admin', N'inactive')
GO
INSERT [dbo].[OK_Categories] ([Category_ID_Auto_PK], [Category_Code], [Category_Name], [Category_Description], [Category_IconUrl], [Category_ImageUrl], [Category_Parent_ID_FK], [Category_IsParent], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status]) VALUES (2, N'CAT0002', N'Industrial', N'These are related to Industrial Services', NULL, NULL, NULL, 1, CAST(N'2015-12-22 00:00:00.000' AS DateTime), CAST(N'2016-01-19 00:14:05.503' AS DateTime), N'admin', N'admin', N'active')
GO
INSERT [dbo].[OK_Categories] ([Category_ID_Auto_PK], [Category_Code], [Category_Name], [Category_Description], [Category_IconUrl], [Category_ImageUrl], [Category_Parent_ID_FK], [Category_IsParent], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status]) VALUES (3, N'CAT0003', N'House Hold Services', N'There are related to house hold Services', NULL, NULL, NULL, 1, CAST(N'2015-12-22 00:00:00.000' AS DateTime), CAST(N'2016-01-17 22:50:38.320' AS DateTime), N'admin', N'admin', N'active')
GO
SET IDENTITY_INSERT [dbo].[OK_Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[OK_Services_BaseFare] ON 

GO
INSERT [dbo].[OK_Services_BaseFare] ([BaseFare_ID_Auto_PK], [BaseFare_Desc], [Base_Fare], [Base_FareType], [CreatedDate], [UpdatedDate], [Status], [CreatedBy], [UpdatedBy]) VALUES (1, N'General', CAST(149.00 AS Decimal(18, 2)), 1, CAST(N'2016-01-28 00:00:00.000' AS DateTime), CAST(N'2016-01-28 00:00:00.000' AS DateTime), N'active', N'admin', N'admin')
GO
INSERT [dbo].[OK_Services_BaseFare] ([BaseFare_ID_Auto_PK], [BaseFare_Desc], [Base_Fare], [Base_FareType], [CreatedDate], [UpdatedDate], [Status], [CreatedBy], [UpdatedBy]) VALUES (2, N'General', CAST(0.00 AS Decimal(18, 2)), 1, CAST(N'2016-04-04 05:24:28.927' AS DateTime), CAST(N'2016-04-04 05:24:28.927' AS DateTime), N'active', N'admin', N'admin')
GO
SET IDENTITY_INSERT [dbo].[OK_Services_BaseFare] OFF
GO
SET IDENTITY_INSERT [dbo].[OK_Slider_Image] ON 

GO
INSERT [dbo].[OK_Slider_Image] ([SliderImage_ID_Auto_PK], [SliderImage_ImageUrl], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status]) VALUES (1, N'carpentryy-slide-new.jpg', NULL, NULL, NULL, NULL, N'Active')
GO
INSERT [dbo].[OK_Slider_Image] ([SliderImage_ID_Auto_PK], [SliderImage_ImageUrl], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status]) VALUES (2, N'elecrtronics-slide-new.jpg', NULL, NULL, NULL, NULL, N'Active')
GO
INSERT [dbo].[OK_Slider_Image] ([SliderImage_ID_Auto_PK], [SliderImage_ImageUrl], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status]) VALUES (3, N'painting-slide-new.jpg', NULL, NULL, NULL, NULL, N'Active')
GO
INSERT [dbo].[OK_Slider_Image] ([SliderImage_ID_Auto_PK], [SliderImage_ImageUrl], [CreatedDate], [UpdatedDate], [CreatedBy], [UpdatedBy], [Status]) VALUES (4, N'plumbing-slide-new.jpg', NULL, NULL, NULL, NULL, N'Active')
GO
SET IDENTITY_INSERT [dbo].[OK_Slider_Image] OFF
GO
SET IDENTITY_INSERT [dbo].[OK_User] ON 

GO
INSERT [dbo].[OK_User] ([User_ID_Auto_PK], [Username], [User_FirstName], [User_LastName], [User_Email], [User_Password], [User_Contact1], [User_Contact2], [User_BuildingFlatNumber], [User_BuildingName], [User_Area], [User_PinCode], [User_LandMark], [User_City], [User_State], [User_Counrty], [User_Type], [User_location_LAT], [User_location_LONG], [CreatedBy], [UpdatedBy], [CreatedDate], [UpdatedDate], [Status], [Service_Id], [Service_Descrition]) VALUES (8, N'dev.cruzata@gmail.com', N'Dev', N'Cruzata', N'dev.cruzata@gmail.com', N'123456', N'8982951915', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SUPADMIN', NULL, NULL, NULL, NULL, NULL, NULL, N'active', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[OK_User] OFF
GO
INSERT [dbo].[OK_User_Types] ([User_Type_Id], [User_Type_Desc]) VALUES (N'BOTH', NULL)
GO
INSERT [dbo].[OK_User_Types] ([User_Type_Id], [User_Type_Desc]) VALUES (N'CUSTOMER', NULL)
GO
INSERT [dbo].[OK_User_Types] ([User_Type_Id], [User_Type_Desc]) VALUES (N'PROVIDER', NULL)
GO
INSERT [dbo].[OK_User_Types] ([User_Type_Id], [User_Type_Desc]) VALUES (N'SUPADMIN', NULL)
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OK_Categories_OK_Categories]') AND parent_object_id = OBJECT_ID(N'[dbo].[OK_Categories]'))
ALTER TABLE [dbo].[OK_Categories]  WITH CHECK ADD  CONSTRAINT [FK_OK_Categories_OK_Categories] FOREIGN KEY([Category_Parent_ID_FK])
REFERENCES [dbo].[OK_Categories] ([Category_ID_Auto_PK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OK_Categories_OK_Categories]') AND parent_object_id = OBJECT_ID(N'[dbo].[OK_Categories]'))
ALTER TABLE [dbo].[OK_Categories] CHECK CONSTRAINT [FK_OK_Categories_OK_Categories]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OK_ServiceOrder_OK_ServiceProvider]') AND parent_object_id = OBJECT_ID(N'[dbo].[OK_ServiceOrder]'))
ALTER TABLE [dbo].[OK_ServiceOrder]  WITH CHECK ADD  CONSTRAINT [FK_OK_ServiceOrder_OK_ServiceProvider] FOREIGN KEY([Service_Provider_ID_FK])
REFERENCES [dbo].[OK_ServiceProvider] ([Provider_ID_Auto_PK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OK_ServiceOrder_OK_ServiceProvider]') AND parent_object_id = OBJECT_ID(N'[dbo].[OK_ServiceOrder]'))
ALTER TABLE [dbo].[OK_ServiceOrder] CHECK CONSTRAINT [FK_OK_ServiceOrder_OK_ServiceProvider]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OK_ServiceOrder_OK_Services]') AND parent_object_id = OBJECT_ID(N'[dbo].[OK_ServiceOrder]'))
ALTER TABLE [dbo].[OK_ServiceOrder]  WITH CHECK ADD  CONSTRAINT [FK_OK_ServiceOrder_OK_Services] FOREIGN KEY([ServiceOrder_Service_ID_FK])
REFERENCES [dbo].[OK_Services] ([Service_ID_Auto_PK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OK_ServiceOrder_OK_Services]') AND parent_object_id = OBJECT_ID(N'[dbo].[OK_ServiceOrder]'))
ALTER TABLE [dbo].[OK_ServiceOrder] CHECK CONSTRAINT [FK_OK_ServiceOrder_OK_Services]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OK_ServiceOrder_OK_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[OK_ServiceOrder]'))
ALTER TABLE [dbo].[OK_ServiceOrder]  WITH CHECK ADD  CONSTRAINT [FK_OK_ServiceOrder_OK_User] FOREIGN KEY([ServiceOrder_User_ID_FK])
REFERENCES [dbo].[OK_User] ([User_ID_Auto_PK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OK_ServiceOrder_OK_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[OK_ServiceOrder]'))
ALTER TABLE [dbo].[OK_ServiceOrder] CHECK CONSTRAINT [FK_OK_ServiceOrder_OK_User]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OK_ServiceProvider_OK_PROVIDER_TYPE]') AND parent_object_id = OBJECT_ID(N'[dbo].[OK_ServiceProvider]'))
ALTER TABLE [dbo].[OK_ServiceProvider]  WITH CHECK ADD  CONSTRAINT [FK_OK_ServiceProvider_OK_PROVIDER_TYPE] FOREIGN KEY([Provider_Type])
REFERENCES [dbo].[OK_PROVIDER_TYPE] ([OK_Provider_Type])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OK_ServiceProvider_OK_PROVIDER_TYPE]') AND parent_object_id = OBJECT_ID(N'[dbo].[OK_ServiceProvider]'))
ALTER TABLE [dbo].[OK_ServiceProvider] CHECK CONSTRAINT [FK_OK_ServiceProvider_OK_PROVIDER_TYPE]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OK_ServiceProvider_OK_ServiceProvider]') AND parent_object_id = OBJECT_ID(N'[dbo].[OK_ServiceProvider]'))
ALTER TABLE [dbo].[OK_ServiceProvider]  WITH CHECK ADD  CONSTRAINT [FK_OK_ServiceProvider_OK_ServiceProvider] FOREIGN KEY([Provider_Parent_ID_FK])
REFERENCES [dbo].[OK_ServiceProvider] ([Provider_ID_Auto_PK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OK_ServiceProvider_OK_ServiceProvider]') AND parent_object_id = OBJECT_ID(N'[dbo].[OK_ServiceProvider]'))
ALTER TABLE [dbo].[OK_ServiceProvider] CHECK CONSTRAINT [FK_OK_ServiceProvider_OK_ServiceProvider]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OK_Services_OK_Categories]') AND parent_object_id = OBJECT_ID(N'[dbo].[OK_Services]'))
ALTER TABLE [dbo].[OK_Services]  WITH CHECK ADD  CONSTRAINT [FK_OK_Services_OK_Categories] FOREIGN KEY([Service_Category_ID_FK])
REFERENCES [dbo].[OK_Categories] ([Category_ID_Auto_PK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OK_Services_OK_Categories]') AND parent_object_id = OBJECT_ID(N'[dbo].[OK_Services]'))
ALTER TABLE [dbo].[OK_Services] CHECK CONSTRAINT [FK_OK_Services_OK_Categories]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OK_Services_OK_Services_BaseFare]') AND parent_object_id = OBJECT_ID(N'[dbo].[OK_Services]'))
ALTER TABLE [dbo].[OK_Services]  WITH CHECK ADD  CONSTRAINT [FK_OK_Services_OK_Services_BaseFare] FOREIGN KEY([BaseFare_ID_FK])
REFERENCES [dbo].[OK_Services_BaseFare] ([BaseFare_ID_Auto_PK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OK_Services_OK_Services_BaseFare]') AND parent_object_id = OBJECT_ID(N'[dbo].[OK_Services]'))
ALTER TABLE [dbo].[OK_Services] CHECK CONSTRAINT [FK_OK_Services_OK_Services_BaseFare]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OK_Services_BaseFare_FareType]') AND parent_object_id = OBJECT_ID(N'[dbo].[OK_Services_BaseFare]'))
ALTER TABLE [dbo].[OK_Services_BaseFare]  WITH CHECK ADD  CONSTRAINT [FK_OK_Services_BaseFare_FareType] FOREIGN KEY([Base_FareType])
REFERENCES [dbo].[FareType] ([FareType_ID_Auto_PK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OK_Services_BaseFare_FareType]') AND parent_object_id = OBJECT_ID(N'[dbo].[OK_Services_BaseFare]'))
ALTER TABLE [dbo].[OK_Services_BaseFare] CHECK CONSTRAINT [FK_OK_Services_BaseFare_FareType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OK_SERVICES_PROVIDER_MAP_OK_ServiceProvider]') AND parent_object_id = OBJECT_ID(N'[dbo].[OK_SERVICES_PROVIDER_MAP]'))
ALTER TABLE [dbo].[OK_SERVICES_PROVIDER_MAP]  WITH CHECK ADD  CONSTRAINT [FK_OK_SERVICES_PROVIDER_MAP_OK_ServiceProvider] FOREIGN KEY([OK_Provider_ID_FK])
REFERENCES [dbo].[OK_ServiceProvider] ([Provider_ID_Auto_PK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OK_SERVICES_PROVIDER_MAP_OK_ServiceProvider]') AND parent_object_id = OBJECT_ID(N'[dbo].[OK_SERVICES_PROVIDER_MAP]'))
ALTER TABLE [dbo].[OK_SERVICES_PROVIDER_MAP] CHECK CONSTRAINT [FK_OK_SERVICES_PROVIDER_MAP_OK_ServiceProvider]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OK_SERVICES_PROVIDER_MAP_OK_Services]') AND parent_object_id = OBJECT_ID(N'[dbo].[OK_SERVICES_PROVIDER_MAP]'))
ALTER TABLE [dbo].[OK_SERVICES_PROVIDER_MAP]  WITH CHECK ADD  CONSTRAINT [FK_OK_SERVICES_PROVIDER_MAP_OK_Services] FOREIGN KEY([OK_Service_ID_FK])
REFERENCES [dbo].[OK_Services] ([Service_ID_Auto_PK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OK_SERVICES_PROVIDER_MAP_OK_Services]') AND parent_object_id = OBJECT_ID(N'[dbo].[OK_SERVICES_PROVIDER_MAP]'))
ALTER TABLE [dbo].[OK_SERVICES_PROVIDER_MAP] CHECK CONSTRAINT [FK_OK_SERVICES_PROVIDER_MAP_OK_Services]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OK_User_User_Types]') AND parent_object_id = OBJECT_ID(N'[dbo].[OK_User]'))
ALTER TABLE [dbo].[OK_User]  WITH CHECK ADD  CONSTRAINT [FK_OK_User_User_Types] FOREIGN KEY([User_Type])
REFERENCES [dbo].[OK_User_Types] ([User_Type_Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OK_User_User_Types]') AND parent_object_id = OBJECT_ID(N'[dbo].[OK_User]'))
ALTER TABLE [dbo].[OK_User] CHECK CONSTRAINT [FK_OK_User_User_Types]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OK_WebQueries_OK_Services]') AND parent_object_id = OBJECT_ID(N'[dbo].[OK_WebQueries]'))
ALTER TABLE [dbo].[OK_WebQueries]  WITH CHECK ADD  CONSTRAINT [FK_OK_WebQueries_OK_Services] FOREIGN KEY([Query_Service_Id])
REFERENCES [dbo].[OK_Services] ([Service_ID_Auto_PK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OK_WebQueries_OK_Services]') AND parent_object_id = OBJECT_ID(N'[dbo].[OK_WebQueries]'))
ALTER TABLE [dbo].[OK_WebQueries] CHECK CONSTRAINT [FK_OK_WebQueries_OK_Services]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'vwServicesListing', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "OK_Services"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 251
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "OK_Categories"
            Begin Extent = 
               Top = 6
               Left = 289
               Bottom = 136
               Right = 499
            End
            DisplayFlags = 280
            TopColumn = 5
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwServicesListing'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'vwServicesListing', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwServicesListing'
GO
