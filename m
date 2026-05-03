Return-Path: <linux-renesas-soc+bounces-31894-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 7/LPCQcv92kwdQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31894-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 03 May 2026 13:18:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B608B4B536B
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 03 May 2026 13:18:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 62FA030022EC
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 May 2026 11:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB69C311967;
	Sun,  3 May 2026 11:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="tn/K+ODg";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="tn/K+ODg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023113.outbound.protection.outlook.com [52.101.72.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56AA223DEA;
	Sun,  3 May 2026 11:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.113
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777807104; cv=fail; b=Rh0GVCU0mKX4G43G6tyL34/2H2Gq0Kn4Y5WEUdVR3NK1Mki02c6H9jYJxKsdpJ1OhGTU4iuVvh8fafQfOPCvHg9XFLXD4f58iPA+rW6eSIXFmPtgiYqhp0eOggZvBBVtAEnqGgbr+TnKHJpt/oHAgXWW3z+Ki5w2zLWRuu2188o=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777807104; c=relaxed/simple;
	bh=bpGwpCveE5eIF8ETWqSDVPGbConfHmLkEk1G4WmGWzM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=SM0lav1KSuH0CcCutd0EoWNXnZurv8ZJZNq3pp2kUPVbrqI0TViT8YKn9IZ8bQWxP9ikrcjzYCUAX4nb1/swXPvduS+JtHG6hscZjWlQRou1u1ngkfqUgWrTiuSp6HD2JWKbkGp3XKXGShp37QIQSxkL40xAQJPluxMVbUUd2PA=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=tn/K+ODg; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=tn/K+ODg; arc=fail smtp.client-ip=52.101.72.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=QD7xGEfhf9BWCxGE51I/Ss+5W5LnqqV/JFRfm9N5iqLLrsBXLeMKMaQHPOb0ybQsQqkPZBqqiPgYd8WRR0X7ZWrfFlfEwqLBvCERlcI+m1lBsjLPpohaAfhqSknojAe5pEZ9j9Il3m5PxwWxZKyCO0/ZQTRayg0OEY6d5Zqkh0+FX6tizQuwFsku0+xTunLlcUwQZFAgdZn4JxqdKQ+ZEsT6lCuxKPEQ/HB0K/ItYEys1Id7eBchOVG3rIFefqDCRAV5ZzbbCIw1PeJvirMyBUNB6VOSJRgJrX2Hs8/eddiYggVxdjGaUl6UJvIqKMogY9p2RjpJxg+q2HgStAbXrw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VLlPVI2YAqpBpliJmob+UkLx30fnExT7BfSnCLNyqUs=;
 b=ykzgLaYl0ZcbznpfmsFnHC/VmbG52RI9NScpoT+Hn/waY5hziEvPXaE46YiTsPLoyqoTnGBaAm6/P7TGvtkpUhPj21RI/rfdgcrUPAsqs+0jQAHqYiMPeps9q6ZGh33maUVosyyI9s8pseQ5QDwmbDB+ZDL2kKEjIzruzeFx2/KsFn4tSsSTSb0sAPUmJw6RmCfoP4K4hi5Fe70DF5vpLKqOV44SBVcF+gGy/Q3MxyTCBde7db3sZfChlPz2CqzTeLQ4uuzdXFinheyNeLj0B0PY3W5WZKwtunMtWwd3oC+HZVDTbDpFh8rVOo9C23WgRaBO/VL7AIozXDXOUhjUUg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=glider.be smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,1,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLlPVI2YAqpBpliJmob+UkLx30fnExT7BfSnCLNyqUs=;
 b=tn/K+ODghCfVO/zX3xSKfK/+4eOpxT4ixoms3/748wmPBPXC9etoyByRBiXtnMR++TJ08e+60ViYRJoPg1Xa4nIYML+pktBeX4LqgS7PdO7LcqDxk3/qau/f4o0rOQiL6skCPlhMoZ+1x4pY0lyjPr+20uNFeI8JLWe6F3EZR9OLl7NPtZSmR1xtHEbsNCPGIaBqUY6QGiuMi/saOVic0sLRRY7ujHCA9elIlUNH5ZWpdlFrMWbmfyIPXqcWRgoFyHFzTu31uBEHOJgHnP3owxUWWLIQqEjXVmTmPKr4AGZeT84U6r85Zbhjw4IXuCy9/dGSXrDuftgPH3Ko/WN1bg==
Received: from DB9PR06CA0026.eurprd06.prod.outlook.com (2603:10a6:10:1db::31)
 by DU4PR04MB11754.eurprd04.prod.outlook.com (2603:10a6:10:626::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.24; Sun, 3 May
 2026 11:18:18 +0000
Received: from DU2PEPF00028D04.eurprd03.prod.outlook.com
 (2603:10a6:10:1db:cafe::ae) by DB9PR06CA0026.outlook.office365.com
 (2603:10a6:10:1db::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Sun,
 3 May 2026 11:18:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU2PEPF00028D04.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.22
 via Frontend Transport; Sun, 3 May 2026 11:18:18 +0000
Received: from emails-3508208-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-243.eu-west-1.compute.internal [10.20.5.243])
	by mta-outgoing-dlp-291-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 90CA07FD1F;
	Sun,  3 May 2026 11:18:18 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sun May  3 11:18:13 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ruhra0AEpxOZbRVuRIvGTj2KcGJa2orH0wZ2/a0C9n6ZMVdMBRzbexzjnVLTGIf2JdORNzkLwuvRm5Q2ZIQ3bA7F953epSyM4wpGKFfDbSIZcptMB+1C6Jl3woHH/PKQeLUj+9ki/yQFjaa1Yv9QxLLqeFFzz5uoMdSQE0jJOG/QoASEyy/vNh1R+jEyKjx+0xBIB6IfTE4l/IAZH3pqtwvRv6OkWSc99psXyNLgU/iKk+t8y9ncjsg9H6nm0EJAdap5McKNs9NwcdDtt75q3na/iRszx0sIb+hlCuDR9NSidJ+q/jba34nox+RNEofDgCJ9v6mz1nVjAOagTRDyVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VLlPVI2YAqpBpliJmob+UkLx30fnExT7BfSnCLNyqUs=;
 b=JXiWJEyynlkRgdm2e30dosfxMIqXleHStooRphuH8QRwyO/GqO9q+BNrac8sPFlFVm3J0ggqYLQd7UdHFJD9Mdnbz0C9PdYmCaxdQVRcWmc1BS/xAYbEeTrtvV6TSGxmMUh2o3np3BHyZVoaxhc18LyhXf20jh4hR6HyLpdji7WZ5k8x8WH4hwLJ6vcFJVuhwb6/YJeB97zCPaxBuvWHY3QOr64T3HfBozf78A+Ur8A9oFyWNyF1xbJXvOYZidFphxtdujusQzfwcIOuEllCMTQHVBA2KjIT3lDsebJji89Vd8v2+7Vzy7l3gu8Wg6G7AL1qqODGy/w2OMvxXdmabA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLlPVI2YAqpBpliJmob+UkLx30fnExT7BfSnCLNyqUs=;
 b=tn/K+ODghCfVO/zX3xSKfK/+4eOpxT4ixoms3/748wmPBPXC9etoyByRBiXtnMR++TJ08e+60ViYRJoPg1Xa4nIYML+pktBeX4LqgS7PdO7LcqDxk3/qau/f4o0rOQiL6skCPlhMoZ+1x4pY0lyjPr+20uNFeI8JLWe6F3EZR9OLl7NPtZSmR1xtHEbsNCPGIaBqUY6QGiuMi/saOVic0sLRRY7ujHCA9elIlUNH5ZWpdlFrMWbmfyIPXqcWRgoFyHFzTu31uBEHOJgHnP3owxUWWLIQqEjXVmTmPKr4AGZeT84U6r85Zbhjw4IXuCy9/dGSXrDuftgPH3Ko/WN1bg==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by AS8PR04MB8022.eurprd04.prod.outlook.com
 (2603:10a6:20b:28a::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Sun, 3 May
 2026 11:18:09 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%2]) with mapi id 15.20.9870.023; Sun, 3 May 2026
 11:18:09 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sun, 03 May 2026 13:17:58 +0200
Subject: [PATCH 1/4] dt-bindings: soc: renesas: Add various SolidRun RZ/G2
 based boards
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260503-rzg2-sr-boards-v1-1-8545677f93ca@solid-run.com>
References: <20260503-rzg2-sr-boards-v1-0-8545677f93ca@solid-run.com>
In-Reply-To: <20260503-rzg2-sr-boards-v1-0-8545677f93ca@solid-run.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Jon Nettleton <jon@solid-run.com>, 
 Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Yazan Shhady <yazan.shhady@solid-run.com>, 
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0023.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::9) To GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GVXPR04MB12057:EE_|AS8PR04MB8022:EE_|DU2PEPF00028D04:EE_|DU4PR04MB11754:EE_
X-MS-Office365-Filtering-Correlation-Id: d93f33e4-f9c8-4818-658a-08dea905adaf
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 UiESJpFYu9Mktmv2yiWDsnKa5hK7YH4NIAUy9zLZPJocm/ooqVhum5VMAOxZ9LM7dJ/YD8B3u0oXOocXXpLosQxHRL93QL81KhOYNxhG0KEiyuNftM44te3TvDDB1CyN8uR7yH7rXyXUiqyJLUZLtFZdUOwYzo9qGjEQxrnfUeik50kBgT8uhXfy1dukxkANkN8wxRNiih6N6PatT7BwOwmqdk/9zdEJoIgvph6xQz+0p90EdF97nXVaLwN598RRlI3Xl9ONlAkyquBZw1xuOo5lR/6RgViylU1ovYvt4AH4ooTdkTASBJEbJd0mH43wxIdf/jLFgDMyEYC+v6ptMcBrTdOvy62DRPIdMcRDLtK/9oJ47VzF3If565nMFirwuRMZtcYJtniVy4NqVqoEQgkixgKryY0yadTw0oxVNVSAJBJC8l0FAXrLCpZfQ8pv6anRdXJeGemPr8E2sivEwy12tH/F6tRo0NzpZ51goVF8m63zhrxeWqMjZ3D6P2q62ecUM8WJWxJTrMVOGRrqZl4Ll80n6XwWEwb0TT5BmY5PfxkE20hdUdMqfnNENRDesgCEm3786d97tX05om9cgdalpWyJne8p41pOrV6uBgeiB1dcCoKWkOQ6OAJoVovF5trgVNU5MiljdbMvux5ZA63bCsp90ysntVFD9DYs4IX3qvUM5p8hcXOGBYIuBMsQmJ5OrbGqARfkRUDiMNTsXxDgKkrOOrOSkSSIv8LpAnv8hlK/PqxXWVRzbRxvCVBi
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 TdDD3foKsPYb3W5NVlO/qiYHeA7LjQPItSxlxFCPYG94n8zGS1eMvTNg2PWRvTQubVZhxEXG1BLMuXYib41jOlujzAdfz6ImrI1UNRFZZdhikukifE7uSZHSIEqCqI/OmA7z81asau58EXqTBPfOCAd876QGvmydRaqVqX0YQ18whGpY2Aethr3qHpi3CNaXm6TDrvhDhAuodt+5FWoEN/4tC0GQ1XyFmmc6/WqfU9M+Ls04GmMiLw0rj4ozvDZy9nYZTerv/Udc4IZGIZw7yg9e+HPJ+cm8Fhvyz2EV3n2TVHuER6aPZ/sIpysUJbuV1oCSTh+8O5IhL0fMcD8U7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8022
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-6.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 37582a88de424616a0eeece1d9c9104c:solidrun,office365_emails,sent,inline:4d3f30dacdf940b3d93398ab685c33cc
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D04.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	87ec864f-a23b-4cbb-e036-08dea905a83f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|14060799003|35042699022|82310400026|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	2IAyCcyopT2CYl9c6TYgigPq18xfZZElpTaRCxU1/oUoHTNS0yps/Vk9HUE1lhdKb9PP24YN8LZM5JuBPuch5MAA5cLn0w5k0FTUSzMM23EU3Ljow8hPh1CJJZaGhdWzKwhlBp3ODjZZPEKIvRQt+GK/CyKx/VC84Qm2yz/MNzv5tcyn+YwK3hmf76DiGW1sAl45GLC4kdefs+Kr5QO3+JbfzMtThqBLMEz6qZ8/x5ySCVGG8y8y26rf8timM/YrztmJRWb+VfOQt8h3xn8qzhvQvxDHJDgRAcEzv7kaJBwZoI41U0ifNpojAlyqybqp+dsA66POSvDgx1K19Lm4wc2AiPQtXFXXoevOsj4LwecO1GJ140UoiIO/xew0qSA4IMdl8hYDHt/QX+xt9ayekSRAG6qBiBa5lh3O81uBVeEPFcF7yK+b3vv/e8Q9xgWxTBOLlEVq7eDHt4fq51ONPJVetudkRvzqZirKzgiAVEP0dPBObri+JQIPJp645Tkv+aDjj3YMtyzaj24PzrKtkmrkHXz3JVxYtft4JQuukPyW58C1AyKgC1Qd7v7UpJIyi6pLoBwfmw062ouwhER1Og7Phogxkxys9346hEXeUh5Tv+U5cYgE3K91zTZ++u+aSeHiNy6EfRQXd19qC8MiFlzR3sgka5w6KFIw3PMoX4zwLzx59NzCT3p6rxPlG8TG6M/Xxqd3BH5I1Lt1/2yHZ8Dj5cNaCAvYoJ9/KRp7F8I=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(14060799003)(35042699022)(82310400026)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MhfgSnwudyPJ8i3+uqNnbJFTJuXoXy67QtSL+9Co4/u+3sr+SvKlicmw4QGy07+hpqYEsGFoMKpoSQ8wFX3cwWnpCAYeBwTWTJHJoRWHepq+8BZEt6YrcK2//GATL5VBKmSaqQcCzpRAPrZwQUhJkaeJspB/ihWW1xjn2oQ7eAutNuS/njBHTKwO9H5y7tU3YaE7kOIjWe7tTCG/WOUZq+hfPW5bvY39aJC2NpvlP9fvkC4kwBPQdZTD7KWFb+9s4eQcSNfc7+0CdpryO4mKePuFhDQkP37Bs6/zJZNZMRruLiGGdwX2HfTYvbeDIzt9EFBZ3Bo1eei6C16lboz+a3ZsSKJm+hjryVTzEKyY6Ouif4aGvBJvDwx112WvwTYi+iPWJ50L34BCiEkTvquFZtHRAaj9TWjITPgzCKs4uV2CUFs734E+uWHvO9OpyvHm
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2026 11:18:18.6641
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d93f33e4-f9c8-4818-658a-08dea905adaf
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D04.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11754
X-Rspamd-Queue-Id: B608B4B536B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=3];
	DMARC_POLICY_ALLOW(-0.50)[solid-run.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[solid-run.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31894-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[josua@solid-run.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[solid-run.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]

Add bindings for various SolidRun boards and System on Module built
around Renesas RZ/G2 family of SoCs:

- RZ/G2L SoM
- RZ/V2L SoM
  (shares PCB with G2L and has very similar programming model)
- RZ/G2LC SoM
- RZ/G2UL SoM
  (shares PCB with G2LC but programming model differs largely)
- HummingBoard IIoT (RZ/G2L, RZ/V2L, RZ/G2LC)
- HummingBoard Pro (RZ/G2L, RZ/V2L)
- HummingBoard Ripple (RZ/G2L, RZ/V2L, RZ/G2LC, RZ/G2UL)
---
 .../devicetree/bindings/soc/renesas/renesas.yaml   | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index 5c22c51b1533d..889d4c5e8cd1b 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -502,6 +502,14 @@ properties:
               - renesas,r9a07g043u12 # RZ/G2UL Type-2
           - const: renesas,r9a07g043
 
+      - description: SolidRun RZ/G2UL based boards
+        items:
+          - enum:
+              - solidrun,rzg2ul-hummingboard-ripple # SolidRun RZ/G2UL HummingBoard Ripple
+          - const: solidrun,rzg2ul-sr-som
+          - const: renesas,r9a07g043u12 # RZ/G2UL Type-2
+          - const: renesas,r9a07g043
+
       - description: RZ/G2{L,LC} (R9A07G044)
         items:
           - enum:
@@ -513,6 +521,25 @@ properties:
               - renesas,r9a07g044l2 # Dual Cortex-A55 RZ/G2L
           - const: renesas,r9a07g044
 
+      - description: SolidRun RZ/G2L based boards
+        items:
+          - enum:
+              - solidrun,rzg2l-hummingboard-iiot   # SolidRun RZ/G2L HummingBoard IIoT
+              - solidrun,rzg2l-hummingboard-pro    # SolidRun RZ/G2L HummingBoard Pro
+              - solidrun,rzg2l-hummingboard-ripple # SolidRun RZ/G2L HummingBoard Ripple
+          - const: solidrun,rzg2l-sr-som
+          - const: renesas,r9a07g044l2 # Dual Cortex-A55 RZ/G2L
+          - const: renesas,r9a07g044
+
+      - description: SolidRun RZ/G2LC based boards
+        items:
+          - enum:
+              - solidrun,rzg2lc-hummingboard-iiot   # SolidRun RZ/G2LC HummingBoard IIoT
+              - solidrun,rzg2lc-hummingboard-ripple # SolidRun RZ/G2LC HummingBoard Ripple
+          - const: solidrun,rzg2lc-sr-som
+          - const: renesas,r9a07g044c2 # Dual Cortex-A55 RZ/G2LC
+          - const: renesas,r9a07g044
+
       - items:
           - enum:
               # MYIR Remi Pi SBC (MYB-YG2LX-REMI)
@@ -529,6 +556,16 @@ properties:
               - renesas,r9a07g054l2 # Dual Cortex-A55 RZ/V2L
           - const: renesas,r9a07g054
 
+      - description: SolidRun RZ/V2L based boards
+        items:
+          - enum:
+              - solidrun,rzv2l-hummingboard-iiot   # SolidRun RZ/V2L HummingBoard IIoT
+              - solidrun,rzv2l-hummingboard-pro    # SolidRun RZ/V2L HummingBoard Pro
+              - solidrun,rzv2l-hummingboard-ripple # SolidRun RZ/V2L HummingBoard Ripple
+          - const: solidrun,rzv2l-sr-som
+          - const: renesas,r9a07g054l2 # Dual Cortex-A55 RZ/V2L
+          - const: renesas,r9a07g054
+
       - description: RZ/G3S (R9A08G045)
         items:
           - enum:

-- 
2.51.0


