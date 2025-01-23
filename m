Return-Path: <linux-renesas-soc+bounces-12433-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB5CA1AACD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 21:03:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD4831889052
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 20:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1AFD13212A;
	Thu, 23 Jan 2025 20:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="DJ3iSQ0r";
	dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="OqvTv6hc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF468BF8;
	Thu, 23 Jan 2025 20:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=216.71.154.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737662618; cv=fail; b=rPoH1jXx7PkaWTvrkJ9ZYgLJ1LMS8Vjq7EvYuZrBrBcvFDXuwaa7XnF9Z/e+qIpcMXAlq7XYifdwKwNqsfGrlVCj3eglUXwzDb7W1F6IrPJpAOyGKzdR3c8UEf5v3v0s5oP5RQSI6B106RCdYAiKrX46ceu9V8DzNE5zJWTmieM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737662618; c=relaxed/simple;
	bh=AGqeBgPfLMD3iEyR8Cs7cJe8MfDbrR0r2bxAzzde+OQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=F6xkCkOBahKtTdxxoMk0THND9jJh2L6ba0BDjqQKlI4zdRHQ7qHE7PmIpiMb6FxPMFp1KuEgSXPvTlfLz3CVgKBCdOmjUqi/dT5En+GCEPnIny4o9z3j94ZvJrPBUq6KMbBr7x88pIA+135oQhxrojojKpcwFStFN7T/JpyJMvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com; spf=pass smtp.mailfrom=wdc.com; dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b=DJ3iSQ0r; dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b=OqvTv6hc; arc=fail smtp.client-ip=216.71.154.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1737662616; x=1769198616;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=AGqeBgPfLMD3iEyR8Cs7cJe8MfDbrR0r2bxAzzde+OQ=;
  b=DJ3iSQ0rFjQaMNQnTCCSbE/X61q7VqniQfI21mlzpz8rXscmVbMJvdyy
   n3uR6Pl6HBKzwzZvpHJH8B22mOuju/7t7C0NL1v+zc13ZFAnJrbwacfAW
   6tpafrP6KwEDcYeRADRUQhs1hbY+qhItgfb2tUFmrKrHaujjFKKGUxemH
   nCU3HyJaPGcqjWWNntfXMHEMmouYFmCOcy+DIWPF89h42EDOO1NqbJi4O
   eo3y/QQuhG45xoy7k88QP4wNnsZ+kZbdAPr5B5uyjxauTEXK6Tv051JwQ
   VSSYVpITND5QBNy21w/D0RtBTsgpz05HE41bqQxz+ws3XLkzxbgtbr+XP
   w==;
X-CSE-ConnectionGUID: T4BiDKGLSBGlKbbqQ7yqKA==
X-CSE-MsgGUID: debGnQzIQTCLBPS1mSKcVA==
X-IronPort-AV: E=Sophos;i="6.13,229,1732550400"; 
   d="scan'208";a="36422096"
Received: from mail-westus2azlp17010006.outbound.protection.outlook.com (HELO CO1PR03CU002.outbound.protection.outlook.com) ([40.93.10.6])
  by ob1.hgst.iphmx.com with ESMTP; 24 Jan 2025 04:03:28 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gXvCPZRNEiY5oIJKsYsECvPSc1A6t+8VeQdWGUtVnzGYAG7Nz7I73I78T9GXy3EWYGIg615w8e5gcuI1K+qk4aoARY9Djf2LYB0gBGTL4V0ZW3bVsjZSVmAgIock5VGNRgDmHRzpdnQTFG6BfMEmsUdrD0Z6wnt/Shz+kdokCQx9FiHiWvRZvZHAVujA0yah0pdUNsGIObBdLC40iqtE5uwuMCZFF9j9I3dtPDRKz0JjSiZNAf6/wSfiSOi8mJLFzNtB6HumeoFywKZHFhqvkdzgbXxgYih89J531WwbMe7t7dKCGDhN96NFNrveR7FqoATjA+9m/euXK+NPz3ac3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AGqeBgPfLMD3iEyR8Cs7cJe8MfDbrR0r2bxAzzde+OQ=;
 b=BLrjzmWtmPEE2Rrn9W7C1GKyzv1X0j3hrDC5dlQWcMOuaCHYs5uNdRTSMO7dqPn2tRlTx1E9i/63w2pY3CK+vzVbkuVj6VrdKg2Mrvk1yKB9vB2f4RgcvUg4mwIgeU7Y/+D3j9xCJTfHO76Gb7Quk1XjUTmQ3s25OnlwhQS7vK8jcmyyn/V+HfGm3Fv0Vmapi7z6NOum/S2yKelz2ucixozrocZeOl1taaUUBGwcQJ8kM/vOPAhMXOyfkX71c7Zzu7zqLYDwLH1kcWPWx3euE5fJ7kxPGhuiSpaEtjxEiJnIgglLiBWZn8ZCO2zN+xQyqAAnbxCtf68YyPoiv8dxEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AGqeBgPfLMD3iEyR8Cs7cJe8MfDbrR0r2bxAzzde+OQ=;
 b=OqvTv6hc74uuLoUf5WXSyezcJTo8ShNrD/W1KpWERmEEvDbX2+dwb0LgOG3jYe+0t8fRxmogT8ernqTLY/yTqv6tWiGdhtPiWK6Y5QqaZ4BUhOX9MqkY++KhdTNIg3YN2oZWuCR0HBnvRuxGte9WFfZiBIAgtY+EwS8F5Q71q4A=
Received: from DM6PR04MB6575.namprd04.prod.outlook.com (2603:10b6:5:1b7::7) by
 DM8PR04MB8102.namprd04.prod.outlook.com (2603:10b6:5:317::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.17; Thu, 23 Jan 2025 20:03:26 +0000
Received: from DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::bf16:5bed:e63:588f]) by DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::bf16:5bed:e63:588f%4]) with mapi id 15.20.8377.009; Thu, 23 Jan 2025
 20:03:26 +0000
From: Avri Altman <Avri.Altman@wdc.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: "Martin K . Petersen" <martin.petersen@oracle.com>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Manivannan
 Sadhasivam <manisadhasivam.linux@gmail.com>, Bart Van Assche
	<bvanassche@acm.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] scsi: ufs: core: Ensure clk_gating.lock is used only
 after initialization
Thread-Topic: [PATCH] scsi: ufs: core: Ensure clk_gating.lock is used only
 after initialization
Thread-Index: AQHbbJcgG4YGDg9HUEa2rPQTDp+F4LMke2WAgABHsNA=
Date: Thu, 23 Jan 2025 20:03:26 +0000
Message-ID:
 <DM6PR04MB6575B668C3A5124BFDAA9B9AFCE02@DM6PR04MB6575.namprd04.prod.outlook.com>
References: <20250122062718.3736823-1-avri.altman@wdc.com>
 <CAMuHMdXB2NLs0yVSf_3RpUip4pAW5kC8Y0Ow2G_GiZirZW1Yjg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXB2NLs0yVSf_3RpUip4pAW5kC8Y0Ow2G_GiZirZW1Yjg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR04MB6575:EE_|DM8PR04MB8102:EE_
x-ms-office365-filtering-correlation-id: 8fefd977-559d-4244-65ba-08dd3be8ffc0
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|10070799003|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UFJjbEFOM2JaYmRlb1piREw0YWVObW9BbW1UYVMxMFlqbEJWNEwxdk5sYTNm?=
 =?utf-8?B?ZlBKVFFXandZN3IwR0tNcEVjelluT3pWVEJ5U2FYREZQbjBWRjBOR2tQaTJ0?=
 =?utf-8?B?WDZ3WUxST1FtZFhWdkJMVEJvZkZEbmVVcktVWWFtVGpxcUdVTjdob2xBYkQy?=
 =?utf-8?B?U2xCN29IbUtGbFJVQStldWVzVWVQTTgyK2ZIaUtTS3BTcWlMRUVuUy9zSVZx?=
 =?utf-8?B?amxlcnNFWTNFYmZTTVVyZld0OVlPcC9ZekViYTlZS05NbVVWUmhDNnpCSzF4?=
 =?utf-8?B?ZTZLOGZzVjNIaHNzcFozUFJIUS9BdWR2SExybDBxemluWDN2dnVPS0xPSldt?=
 =?utf-8?B?b0FHWXRMNHVWdm5Id24vdkowQjlpMXNZZ3VrUjhRNkIvUmJsZFpvTnI3RnE2?=
 =?utf-8?B?dXJuMmlNOEVyS3VmeHFra0ZrdURzN1J6TUlBczkzUDBRdEwzKzIzanhXeGtC?=
 =?utf-8?B?ZW5zZ3B1bENCSDM1d1IxbFRWdDZ6U2Nkc216TmRwK1MwRDVzYTlReG5ra0Jv?=
 =?utf-8?B?cmJZRmxZdFBqYURncmIxdlpVemhWUnRvb0hteGZvM2xjNkR6S3g3SjdDQ0l5?=
 =?utf-8?B?VXluNkZMRUljd0NBQ1lDdDI1SGlyMVdLWmdBNjY0czNNaXlmcmNvbTA2SGNQ?=
 =?utf-8?B?bGNUYVNoZzcwNHQ0UkoxWGR4K3hHNG82bk1wQUpQQ0xtRUd5MXhTMnVVYm1W?=
 =?utf-8?B?M1JmQWV1Sy9rNGlqSko0YzF1a0s4emk5NHRFaHhPWFQrckpvV2daNGlKZnk2?=
 =?utf-8?B?bGJ2MDgrVkFHSUJzdTdlRm13R0w5NE5qT0xJREw5UFhjcDZCa0lIQTFsdEtW?=
 =?utf-8?B?L1FnVlI3a2p3QUUyVW5ybTYra2ZzSWFkVnYxY1hDd08zcUJwcXJzQWJRZmw1?=
 =?utf-8?B?WU9KMVNTRGNsRWFuaEJnY0hMMDR5eFcwNG9kVWxQb2lHcTdsOEgrVkJqVjN1?=
 =?utf-8?B?cUFpcUMzc1pDL3RHTXhsaWp3ckF0ekZKdzVkY0IxdGMyUzM2MjlZdzJpVHcx?=
 =?utf-8?B?aUNTL2R1TGM2dVdFaG9rdC9Nem04OTdoUkdTOGdleWZuendlYmtTcEF3ZXk5?=
 =?utf-8?B?S1dDRVZLSGtSNVFQMDJnbHN1cFJjTnNTS1dvUGhGdzh3MmdaaHE3c05NMGZj?=
 =?utf-8?B?NS9TT2VVTGZQbXgrdVNkUFhFTWRKR0gvVWhHM1FDcisrVG5qQVhYL2cwNVdw?=
 =?utf-8?B?Z1VkcjFiQ0VjRWxBTFlGUVk3VVdkdG0yQXU0c0hIcDBacWhBRFR5clVmWTBz?=
 =?utf-8?B?ZUx6T2dUQ1cxSUFrNlQ0YUR4WUNSRDhVMEFqN1hQcTZJVzVNSEwwOWZsVlNn?=
 =?utf-8?B?ZzdiK00yc0tEWXQ4Q3UyVVlOM1RsRUQyRFJMTHdmajFsazZtL0tTNFhETjA4?=
 =?utf-8?B?K2U4d2hvNXlrRHNUSGdheU1VcVYvMnR6ZTk5SVBVRktuenBaRDk4R2xJeTdS?=
 =?utf-8?B?aEovTE1wRlVwYzhUUHE5emkyV1dqSC9kL2FJYi96QkNXVTU5Q043R3FrUC96?=
 =?utf-8?B?T0V3bzhEeWpaUWhwUEhEZ0pycTQyR1NQL3UxK0dwcVFsZnRIYTBRL3hqTktq?=
 =?utf-8?B?QWNiK05LSDZDdzRkRU8wdVJrU2ovVUU5K2JhdnV2bXJZS3hOdzQ5WWlxbDlM?=
 =?utf-8?B?U2tLNWJBQm0rSWNmVmlYVFBpS0tKc2RMR0JOcEdYUDFWdURMUzlhZGFwK1c3?=
 =?utf-8?B?ZGE1N3lBOGN4bk1QVnNiRnJ5TnpVVzNLeEZqbHdxeW52TFRCZkR2SGF6ZDhl?=
 =?utf-8?B?Q1ZtMkEvZDJocWFraFdycmFEZU1Ob3ppYmJCeHB5VjdydHR4RkJ6V2xzT1R1?=
 =?utf-8?B?MHhWbnRZR0JwZWNYVnNyeDcyMXJ2OFI1SEVrcVdMMmdvMnBLUlNUbjhPVGkz?=
 =?utf-8?B?SlBENjJkdW1VcE16b2FvNUFtdU1NNjdGYysyV0IyWE9pOHpkR2dFc2llVUhw?=
 =?utf-8?Q?C2tcQ+Cds23+pPDMWTQ5+1RwB1koK9ZV?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB6575.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?enkrMGZ0YnNoVE4xbzhpdlFlUTdZR0N5aHYwUFJPZFE1NVZGcHlDZnMrS3o2?=
 =?utf-8?B?bjc1OHRJeERycEdWcDA3TGVvMlZkUlQyMlYvQklnbDAwNGpsSFMvV3ZtcTE5?=
 =?utf-8?B?L3kxcHJIUjR3bTBEcElLb0JpZ1h1alVTYmQ2Q1ErYVl0eTQ5SGNwbkxtRk5Y?=
 =?utf-8?B?d09UeGpMemFmaEo2Y1ZqUEFaUllyTGR3SXBvdEUyMEZSK2EyVXdiT1RjUFlD?=
 =?utf-8?B?NUNlaTlEZ2o2L3BhMDFiV0RQY2cyMmdSUUtodTJhTXAxcFN2Wjl0emFtV1V0?=
 =?utf-8?B?NnVqazJlSmNXYXdHb2djY0NiUUI4VHY3b2QrWEJRQllwRFdKcVFwcExhZFAv?=
 =?utf-8?B?ZWtzWld2N0szVmhoWDRtTk5jcHRDRXE5Vmt3cWFFRENmSUQrNW10T01ycE1S?=
 =?utf-8?B?akFrVGYxam1VK2VLKzlDRDFuL0twV2Q0ZXdsMVJiUnBjaExscittZmtQMjd0?=
 =?utf-8?B?bDF2MC9TOTVMamRLcG9qVkoyOWZjS1ZCcUx3bVk1aHpCQUZzelc4TXU2cHZW?=
 =?utf-8?B?U0Q3ejlDWERvS3RyMGRPb09kd05ET0FWK21UWXBJL1EyMkpzN1JHc2xPTU5R?=
 =?utf-8?B?Tnk4eE9nOXRScDAxYmxYVGxtamNuYkU4aUVLNlQvMC9mN1hUYTBmOEp6Skhx?=
 =?utf-8?B?V1FXRnVKRGw0YS9mTEJyTUlDZThjSmszMWFHUTJqSjlxajM2OHk5TlU5MmdG?=
 =?utf-8?B?ZTVWNHJFR0luakRnY1N2VmxkUVoxWi9oKzhFbDZxUVRuTlE0UHJUcTFXK1Fp?=
 =?utf-8?B?RzQ3VWxVbDdnLzNFUGxMK3dCUUJrdWFrZUFROGl5cWsyQzJ5dlJsdTFsTFVs?=
 =?utf-8?B?Z1dGUnhZdE50anpISjdRaUFQTzF2TVlzeFJ4NmxXc1R0MTh3bWhzUkZpcGx1?=
 =?utf-8?B?Y3FGb3RNUU93Y0sxcjlQSGxnQXg2Njd5d0NrMW9DcmVJTjU3eUJjSlQ2Vm4y?=
 =?utf-8?B?Z25vc3JMRFQ5Y1pSQkhBUExjdjEyWWFCT0xVVDNOSHRQelpxSnR4cENtM3Mz?=
 =?utf-8?B?T2NJanI0WlNaTU84OGVxRTNrZ2MxNFFEbXhEWlRXZ0ZDcTd0NUhwWk9IRytE?=
 =?utf-8?B?OTNPMk9xcEdtQ1psaGZRV3lHV2dyNDEvTENXdWpTUURWdmV6TzlMVmszUzB2?=
 =?utf-8?B?MXN5bUp3NzVLQlQwazRtV3E4RkxGb2VnVXpWNjJmMFBteis3ZDNEMmtGWnMy?=
 =?utf-8?B?ZmljeUo2cUVkN2tqKzJ3ZmhqUmRoU0lWek9aQlJ5dUxRYmhlUEJUSmZPdFhp?=
 =?utf-8?B?YzFHSWx0SkpVb1VuNUQycEZBNkJIR0xCanR0d0hqTE00WUNpT01DanF0a3c4?=
 =?utf-8?B?Z1dNbEJyRXBSTmJsQ3YvNmt1a3pPN3FiM3JaOE5Ccjg4bnF2MVpjK2hYWVA1?=
 =?utf-8?B?bkVoQWNSdmNPRDVtUUVCRGUrWjE5a043TnRiWExNZkxFTUg1T25xOE44Zkt0?=
 =?utf-8?B?YUU2V2xNTVJicDRDRlBvODFWMTJzU0dPa3I2VjVjS0trNUdsQnRiVzVMS1dD?=
 =?utf-8?B?OWNJc29HM3gxQXpPVXBjb29XR0xRNEw1bmFUOUczM29OallLR0RkYzlaekxG?=
 =?utf-8?B?TFJPVWxTNVN2OWhRQ1QvQmRiOEFCUkZ1RmZDcldBc1FIZmdTVTlzVUFkc3RP?=
 =?utf-8?B?bnJ1c1FnbTBSekp2QVh2VllmTHRIYzZCZEFEdnNmdVJYMnBrcHlEVVdzUXk2?=
 =?utf-8?B?TG1XWTFQYU1lUjBBMlRUSmFVdUVnR0tUWlZBek10UmR3ME54eUNKd1h3VThw?=
 =?utf-8?B?OWF2U292eWJRQlJpNnhrdXJqcG1YUkRTMGR4c2ZEQ2xvcnp2VmMxYks4OWdF?=
 =?utf-8?B?bzdUZnNYYTR2QWhpSmpvSEdXVTF6Q256eld4K3hYc3VJays1T1J5a3ZsSDJF?=
 =?utf-8?B?dTdzUjB3UjREWkhqbE80N2ZlNE51MVNIMDMrNWlvUGljNDNiWVVsM0x2dThx?=
 =?utf-8?B?VFR6TWZEbVFEWDJNQ1lheUFzcnM0eDBtZHUvSkVzd1IvNWxmVkJyTzNwNHJT?=
 =?utf-8?B?WHpIRUpNVGl6RlVPWlhQZm5KblRpaThqbWd5clUwNEN6VE1qNjJyUGJveWtq?=
 =?utf-8?B?UmtYbXl3WjNUYy9mSlovSU1qYXJvaGx3V05ZRDZiczJIczhRWU96bjVzSDB2?=
 =?utf-8?B?K3NTOUxTa3RYdG5YQ3pUS3B3NnkvVmJsak5vcnczRDFiNEtOTXNZQjRtT0Ux?=
 =?utf-8?Q?/LX32o+ZJ9AOWSZZuoMjdDMCjfXRC6fZofoTh4moCNN7?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	a8sXOB1mzdSU1AAwltTMw0OOUfSjnLi2yYXObg+TOcKlQu2LnLyNDYMsP9LRhBLO0JGuhGQdBh1654uj802+VFThlNXUzmu7RfPrLFSAoEjjY6iFTga3QMdNxZSVfIRrE5MT1vcUJp3H6EccjIGfGEd9am0ITvhHtuy3PE5gUj2r3154u9m1m8WHzeLNdxBiplpU4XKya/5zJeUMzRwyg9eJmprOSdGhuGiVHEj92lJ1gScl3HEY4C9XWMHdaDCTas4GnvOoSZJoJ+eDgrrImGqbMNVZDNNhn8HskIQ7AyO3mL+dTX2mtoE7BAtPvTkGV5/wGrskMf23pKKNcKTbSBwKB1FLIPKcc0C8b2CMtzwfBwjpXo23fwXxCu9R9/9yQ626ZtkejAATjz23EbhMZx+FrRPffXnR32np3Epkk0rC6nRvO0tJg5utyy5TpDQSztyZ8YQFCAKcL3Px744qEsoLYzgqMwJ2IVYxFyHZfXoOUR2Om++sEkrJJQGBHr4saH4tkusHvNOWAvIj8K+770ptSHzTw1A4kePXcKF2BeCTQYWP/YhSROEGxrZ79jhibxZw5ss+Cmoe0IJkCZs+h/4xKv9rmBhI6yXl9InF8e01ZkOxVUd3hjan6k43MWY4
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6575.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fefd977-559d-4244-65ba-08dd3be8ffc0
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2025 20:03:26.5592
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BFK7a9D7ZVyL2tKIsgqMjfpLfbt8ZNiDlpY4gcaIi2HH3EVSMRCc/2Uy1kiIZD2MfFFOdVAFxaupUc25U9NQEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR04MB8102

PiBJIGp1c3QgcmFuIGludG8gdGhlIHNhbWUgaXNzdWUgb24gUi1DYXIgUzQgKFM0IFN0YXJ0ZXIg
S2l0KS4NCj4gDQo+ID4gLS0tIGEvZHJpdmVycy91ZnMvY29yZS91ZnNoY2QuYw0KPiA+ICsrKyBi
L2RyaXZlcnMvdWZzL2NvcmUvdWZzaGNkLmMNCj4gPiBAQCAtOTE0Miw3ICs5MTQyLDcgQEAgc3Rh
dGljIGludCB1ZnNoY2Rfc2V0dXBfY2xvY2tzKHN0cnVjdCB1ZnNfaGJhICpoYmEsDQo+IGJvb2wg
b24pDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgaWYgKCFJU19FUlJfT1JfTlVMTChjbGtp
LT5jbGspICYmIGNsa2ktPmVuYWJsZWQpDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBjbGtfZGlzYWJsZV91bnByZXBhcmUoY2xraS0+Y2xrKTsNCj4gPiAgICAgICAgICAgICAg
ICAgfQ0KPiA+IC0gICAgICAgfSBlbHNlIGlmICghcmV0ICYmIG9uKSB7DQo+ID4gKyAgICAgICB9
IGVsc2UgaWYgKCFyZXQgJiYgb24gJiYgaGJhLT5jbGtfZ2F0aW5nLmlzX2luaXRpYWxpemVkKSB7
DQo+ID4gICAgICAgICAgICAgICAgIHNjb3BlZF9ndWFyZChzcGlubG9ja19pcnFzYXZlLCAmaGJh
LT5jbGtfZ2F0aW5nLmxvY2spDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgaGJhLT5jbGtf
Z2F0aW5nLnN0YXRlID0gQ0xLU19PTjsNCj4gPiAgICAgICAgICAgICAgICAgdHJhY2VfdWZzaGNk
X2Nsa19nYXRpbmcoZGV2X25hbWUoaGJhLT5kZXYpLA0KPiANCj4gVGhpcyBsb29rcyBsaWtlIGEg
dmVyeSBmcmFnaWxlIHNvbHV0aW9uIHRvIG1lLi4uDQo+IA0KPiBJbiBhZGRpdGlvbiwgd2hpbGUg
dGhpcyBjaGFuZ2UgZG9lcyBmaXggdGhpcyBwYXJ0aWN1bGFyIHNwaW5sb2NrIHdhcm5pbmcsIGl0
IGp1c3QNCj4gQlVHcyBpbiBhIGRpZmZlcmVudCBwbGFjZSBsYXRlcjoNCj4gDQo+ICAgZG9fcmF3
X3NwaW5fbG9jaysweDM0LzB4YjQNCj4gICBfcmF3X3NwaW5fbG9ja19pcnFzYXZlKzB4MWMvMHgz
MA0KPiAgIGNsYXNzX3NwaW5sb2NrX2lycXNhdmVfY29uc3RydWN0b3IrMHgxOC8weDMwDQo+IC0g
dWZzaGNkX3NldHVwX2Nsb2NrcysweDk4LzB4MjNjDQo+IC0gdWZzaGNkX2luaXQrMHgyNjgvMHhk
MmMNCj4gKyB1ZnNoY2RfcmVsZWFzZSsweDMwLzB4NzQNCj4gKyB1ZnNoY2Rfc2VuZF91aWNfY21k
KzB4NzAvMHg5MA0KPiArIHVmc2hjZF9saW5rX3N0YXJ0dXAuY29uc3Rwcm9wLjArMHg3MC8weDI1
OA0KPiArIHVmc2hjZF9pbml0KzB4YTM4LzB4ZDJjDQo+ICAgdWZzaGNkX3BsdGZybV9pbml0KzB4
NjE4LzB4NzM4DQo+ICAgdWZzX3JlbmVzYXNfcHJvYmUrMHgxOC8weDI0DQo+ICAgcGxhdGZvcm1f
cHJvYmUrMHg2OC8weGI4DQpJIGRvbid0IHVuZGVyc3RhbmQgaG93IGl0IGlzIHBvc3NpYmxlIHRo
YXQgYHVmc2hjZF9pbml0X2Nsa19nYXRpbmcoaGJhKWAgaXMgY2FsbGVkIGFmdGVyIGB1ZnNoY2Rf
bGlua19zdGFydHVwKGhiYSlgIGluICd1ZnNoY2RfaW5pdCcuDQpOb3IgaG93IGNvbmN1cnJlbmN5
IGNvdWxkIHRha2UgcGxhY2UgaW4gdGhpcyBpbml0IGZsb3cuDQpFdmlkZW50bHksIHRoaXMgaXMg
aGFwcGVuaW5nLg0KDQo+IA0KPiBJIHRoaW5rIHlvdSBzaG91bGQgaW5pdGlhbGl6ZSBhbGwgeW91
ciBzcGlubG9ja3MgKGFuZCBtdXRleGVzKSBlYXJseSBpbg0KPiB1ZnNoY2RfaW5pdCgpLCBpbnN0
ZWFkIG9mIHNwcmlua2xlZCBhY3Jvc3MgdmFyaW91cyBoZWxwZXIgZnVuY3Rpb25zLg0KVGhpcyBp
cyB0aGUgY2FzZSB0b2RheS4gIExldCBtZSBzdWdnZXN0IGEgZGlmZmVyZW50IGZpeC4NCg0KVGhh
bmtzLA0KQXZyaQ0KDQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhl
cmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LQ0KPiBtNjhrLm9y
Zw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUs
IEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dCB3aGVuDQo+IEknbSB0YWxraW5nIHRvIGpvdXJu
YWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuDQo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==

