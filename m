Return-Path: <linux-renesas-soc+bounces-12570-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD39A1D5B7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 13:00:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE9FA3A5D84
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 12:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4317A1FCFC0;
	Mon, 27 Jan 2025 12:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="VAhfplLw";
	dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="VX03hOAR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7581291E;
	Mon, 27 Jan 2025 12:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=68.232.141.245
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737979234; cv=fail; b=Oulph5xwYKSxck5bD9Evdo27goIw8as5uwNZQNPlXahHMAAosfxGWQtOPDXuiV/Xbdf9k5oRRkxu/9Jd+4rQ6IfXJOyOZxu3qy9ZnkfHfK9Viaa+B9dA1rre8wlYltsnJVV/WVk6VpqU0hRsbVcvZ2Euu+A2BIGKAey4KoCv7GI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737979234; c=relaxed/simple;
	bh=1LFycFmI0UrlmctJb1OScn9LzCyTcy+LOJCVdxxKfEs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uUYSQglsinhccA+OpwQhcYdZwCjA8OoLOlgiQxOt+dVvvB6EOfTjgkQJc3Gsk4Y+SBDsjqUrOofBQ/so+m0IvWiHRCrL1e5cIrEbFQOoKrUQR9qVNJTJLXFW/lFzX/7KnWSh3G9qBqCPz9bn1ufijg+4l4ixpprUQmlzyj4U0mA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com; spf=pass smtp.mailfrom=wdc.com; dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b=VAhfplLw; dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b=VX03hOAR; arc=fail smtp.client-ip=68.232.141.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1737979230; x=1769515230;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1LFycFmI0UrlmctJb1OScn9LzCyTcy+LOJCVdxxKfEs=;
  b=VAhfplLwy1D1TAVijoyuT9Ceq82Cu+xeImuxvvWyRCGEaciNacwmM9e/
   /FbuaqqOnBz+wTBSgdUmKMezLbFK1rt0MmggR5RtjvBduS4+KwCXSvhR8
   fvbETT7VPYGwu0zWK5/jatnZA2VIQGpQBMF3JKsDaZu1ivchWArxQkKt2
   L3Rq7+zq+cE0rrOSd62mKqCTlsahyojK6JCu7kkwJEJ37oAZa4OGqb7Ik
   gGSPPkKEbeBRLrn/LrZWeF1uCnC4g8OLyO+0zWSm38CejaBA9bomHpOQj
   zEZl8DZov3jEuI7EB9GaE59wgCfo8tHrHxNaWL63hecdaQalYn8Iq2urS
   w==;
X-CSE-ConnectionGUID: K152tnj/Tuq4VisnTL0rFQ==
X-CSE-MsgGUID: eYbiSnZVS2OrjsYMnulC0Q==
X-IronPort-AV: E=Sophos;i="6.13,238,1732550400"; 
   d="scan'208";a="38109464"
Received: from mail-bl0pr05cu006.outbound1701.protection.outlook.com (HELO BL0PR05CU006.outbound.protection.outlook.com) ([40.93.2.10])
  by ob1.hgst.iphmx.com with ESMTP; 27 Jan 2025 20:00:21 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HX/ZbARvuSApX1U7WYSspbeqPnbepIjSCM9xSE1ZqhnkCO53d5MrBJIILghEhRJV4imbrPblAdXxPU/W1O+r+m2/Jts9fK4Ox4IhrAGy6aCsrBY+VkQgQ9Z36hVxgrDjl3aK1RMV/0OaNzxC+k70Nu6G2DdXcSxh/XkXyhQsRERE2gM41XiI8IiBgervxIPshtihfGwQbRy6FVgfmp1YRpaDlt7b5Kb8Y05543PcFzPqnkyk7hs9c5g7SO6Czkr73rIiMKqTQqXVlcbi0ta7cqIOM2UMwthYT6AzNR2x0EQ2pMy5IgPq0ESA7aleqhmIDWWFoWoqw17jsq+uDViOiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1LFycFmI0UrlmctJb1OScn9LzCyTcy+LOJCVdxxKfEs=;
 b=TJPXGaiDwMMKne/njibC/nNJ7BDRh7m7dnbwJCNHD1BRQGwwC1p4cmHRK2ouwNrVflPaURwNgHP5b074UAxqG9mlj/fSsqq8Jvz0UyywxdsUKl3w6jk5zf54/eK65m9YNUR2DXWgrs5/z1hZ0ci6HpMlQAH71TzNmcXrnTngLYgoQ4ZhA0eShMTSZjgXU0UpfnfPZ4wZ+TB9qZh3BPzk9/0U1UjinQgr8uaylMKjVTT9ONoYSNncQpiUzbO0FUv8OBAo/ma3PNyxkZmpP2KxS4lTh9+WNhc/n/SHF6WaABfZQYEJHVSb1HvWYBPiK8ygsldBfROkB1xeQ2nXr9UiCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1LFycFmI0UrlmctJb1OScn9LzCyTcy+LOJCVdxxKfEs=;
 b=VX03hOAReaSO8KRCHuIjsTlqr6Hdfdmay0MIle2UdIQUtpWzU59JAEURE/EKyNn01nRmn7AXGj9BdJyzp9G36EfPNmwLLq/63BUdrysAlyal74BwA53qIcJrrM5CxJUXaXifqMWZFR6MY0EbgLz94CGEO29WdmXZNjWe8KamrmU=
Received: from DM6PR04MB6575.namprd04.prod.outlook.com (2603:10b6:5:1b7::7) by
 SJ0PR04MB8515.namprd04.prod.outlook.com (2603:10b6:a03:4e7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Mon, 27 Jan
 2025 12:00:20 +0000
Received: from DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::bf16:5bed:e63:588f]) by DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::bf16:5bed:e63:588f%4]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 12:00:20 +0000
From: Avri Altman <Avri.Altman@wdc.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: "Martin K . Petersen" <martin.petersen@oracle.com>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Manivannan
 Sadhasivam <manisadhasivam.linux@gmail.com>, Bart Van Assche
	<bvanassche@acm.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 2/2] scsi: ufs: Fix toggling of clk_gating.state when
 clock gating is not allowed
Thread-Topic: [PATCH v3 2/2] scsi: ufs: Fix toggling of clk_gating.state when
 clock gating is not allowed
Thread-Index: AQHbb75UYt4JvqPgtEewjMQ1OoUlILMqaAKAgAAeQgA=
Date: Mon, 27 Jan 2025 12:00:20 +0000
Message-ID:
 <DM6PR04MB6575F17ED95B86B821854AB7FCEC2@DM6PR04MB6575.namprd04.prod.outlook.com>
References: <20250126064521.3857557-1-avri.altman@wdc.com>
 <20250126064521.3857557-3-avri.altman@wdc.com>
 <CAMuHMdUjkwgo+PZBfcp4c2nqQcdezzo=LCAjmHgLhUhS2FcSRQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUjkwgo+PZBfcp4c2nqQcdezzo=LCAjmHgLhUhS2FcSRQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR04MB6575:EE_|SJ0PR04MB8515:EE_
x-ms-office365-filtering-correlation-id: b06ba11f-e087-49b7-6689-08dd3eca2c25
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VHdoSXdreU1yY1NCVjI3TEc3dXBrWGxOYUUrYVhXUC93TmQ0bGdlNUs3L3hR?=
 =?utf-8?B?ZE52VmNwMVQvNTJCMThiUEFtT3dQaHQ2c0Q0eDBWMmFmVWtHMkRzdnc2VVls?=
 =?utf-8?B?UjNyL2VHTTRtQ05ZQUYwL2dueWI4aGwzRlk0L29nTTV0SmYrbGxpbXhTeld5?=
 =?utf-8?B?NWhVeTgvS1paRUpRdVVOWCtyNGNaYjBGSkdIR3RaV0QvdEtNVm5KVkpta2ho?=
 =?utf-8?B?cVZCMUxnV3JUOUxvM3RXS3NnSnB5djhZeG9LVVdBMVZkT29meUdmRnhvUUJq?=
 =?utf-8?B?MHBTWFhrNUpBL0RmMXIrQTRPZDFadXJiakNHTExidi91Ukw2d1ZvMWVmL25m?=
 =?utf-8?B?M2krMktJcWE3UjdoTkltQ2Zhb016R2tXZ2t4SnZMZkpBWi9SZUJuRzFNemRO?=
 =?utf-8?B?Tkg0eGlTOHgxa0ZYdGZySjFEeGlvN1FIS3J0WG83UEU3NTBOTU5zcDVTZ240?=
 =?utf-8?B?NHptL2hmNWtSQS9QbFN4WFk2VjJIZTFHZWJEUFRXUlRRa0VveDUrZ01QaFdj?=
 =?utf-8?B?Wld2UnZwRzNrWVhpelgrL1dXd1NCckp3L3duUkRqOGwydFVpTmpCT2ZoSFVm?=
 =?utf-8?B?MkdRdHZvbzY0ZmRpcFRvTVVKOElJeFd1K2R5cXhnWWxzS2pkLzRRWWU2WFhi?=
 =?utf-8?B?bG5oQm5iNXJldE41RTVBc0RYSkx6U1pzNGJHVEg5QmMwM2FJcXI5djVFekNU?=
 =?utf-8?B?ZXNPblhucno0Q3RCR0RsSEY3NHIrTjBvSk5GM252dy9oNVQ4VFJpeDF5Q0tV?=
 =?utf-8?B?SmdkU29OdEsxb1UwTWFJUVJzR09mV0I5WmJvVmh4QlVXWXRQSE1SQ0ZPRVJJ?=
 =?utf-8?B?bFlNamFpdTFZY1RYM3lJeGc3NEduRjIwSlFBSUU0NitNNGQvd2NtaCtGN1dy?=
 =?utf-8?B?ZVk4YzZFeXoxemsxeHNMWWhIRHlDTUVyc1Z3d28vcDdEd3RBTUZpZkYvbnd2?=
 =?utf-8?B?TGVSeERSck9ENHAzVEZ3a0ZpY1FhNm45ZnBNWHZvSDZuTTdxOEg3UlFIUFMy?=
 =?utf-8?B?YjNSTURvOGRnazdxY2hDMjdWcGNuQVJjUG03TTZVUFBKcHlwZVBRRTZiZ0Vq?=
 =?utf-8?B?RWZIdm1xcjEzRzNMTjJwZEV2UFRqaWxYaVJiekIyeWRJenFwNG5uL3lXS3Na?=
 =?utf-8?B?aHNPWXFHSGRMTG9oY29hY2RMY1VYWExDVWkxa0czWktwa2lGQzBDQ2FlalVq?=
 =?utf-8?B?ZlY5WmsweGJrVHpTZWVXYlZCcjdqS1FUSU8xVk9IRmlvUktpUDVwdlVQeWd0?=
 =?utf-8?B?WndsTHFSTTVvMXJDTFIvaVlKdG5ROGlaZklqSHZDMWxQU3Y1dnVDNXVJNzY2?=
 =?utf-8?B?alhHeDJqRjh6VEtpMUR2NGoyNEhEVnJmeVpBRk1lZUlBdXNZNTZrOSt3NVNO?=
 =?utf-8?B?VjFiZ2xjQzBxelZzaGY4eUJlM2ZXZzM2MDIxdjlpK3RzbFdxMjRHeXFYYVdO?=
 =?utf-8?B?SzlBV0R4RU1LSDV1bjE3WGdpR0dxN042d2RXSUJxWVl4bXIyc0lKVlZ6bzd3?=
 =?utf-8?B?SnhlWjBkYXppZHpWQUt2eUprOUI4Z1BSd3ZZWFUvQ1VSeEpsQW5WQUQycHBt?=
 =?utf-8?B?OWcvQXZ3REo1aUFCaTlsa21Qb2dmY2NvZzIvdjEzMlg5WUYwTS9FakhXdEp6?=
 =?utf-8?B?eHo0TGJTNlV6ZHJOVG5JaUlsRC9kb2FIVytqZ3JweTRzTTNUeFRmWS8rd0dX?=
 =?utf-8?B?bDdLQkZtMzhHMEhPVk5takM1b2x4UHBDdmdKSGRMVGZwOTE1aXhKK0M2NVg2?=
 =?utf-8?B?YnZZMUY2c0Z5cXJJOGJmQU9tNFNoYUQwSDBXVGs0MDVVbG5FamNQOTZlOUFp?=
 =?utf-8?B?S053blg3L2RPRHNMQTBsVGpZTDMwVUNsVUU3Wi9kVGxSQWZoYlVlUE5xRSs2?=
 =?utf-8?B?MjN1VjNhVEs5NUgzMFVhd3hlYnlnR255SXdWMkVLcTZIWjJXaldlem1pRm1F?=
 =?utf-8?Q?Do3sCB27SnfWvItbtPmFIkc86XSxfr+x?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB6575.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d0FVVGxWdmFVRG1iaXhoTjlUZWxsWU1jNzdGaVRIU290UGdRY0Y4R1NKZHhY?=
 =?utf-8?B?UWZkQjJNb2ZXRjdPL29WZmZ5QmRheTYvZzFJMWtWcHRZbDdLTG42OTBHeDJM?=
 =?utf-8?B?TjI2TUtqMldMa1VmbWdONFpRVDZSeStIRXBCSDZ1S3haSlkyMjVTWFdnYlNr?=
 =?utf-8?B?MWE5Q3Z1RVo2cDFYTUh2cUd6eFI2Z0Vwd3Bua1crUEN5Z1Zpb0dDMzlJR21v?=
 =?utf-8?B?eUdDSU1hRlhqWFZ3Q1RleEUyamRQRm8xUzEvbnBCZk1yNFNGSUI5Q0RlaENt?=
 =?utf-8?B?bmJoTlNuY2VxclBCZkVra0IwRm5IdHZaMTkvN2FORUJEMHpDS3FteW9zMTFK?=
 =?utf-8?B?V1J3VGltdVZtZWFHWXpqSXFkeVF6MmNFRFJHa0Vaay9Qd1NXa3VyRTF5TVc4?=
 =?utf-8?B?M2VNRFhzZ1doRmNUcHBpK09LWUhSVVFMeEhEQmtKVzJycXZqaHB1cWF4U3FV?=
 =?utf-8?B?WXIrZHZQZHJxeklwUHdKZHhrWEcyWkVxWENqK3J5Vm1SU1J1OGNBTUFWVitu?=
 =?utf-8?B?N2praVVaUlBXRFlMNTFzdS9OOUZiUlhkZkpEejZnOG5tVW9XbmhGaVprdUJT?=
 =?utf-8?B?MmNLeTFmbmNLaVRCY2FDdTYyU1dsZzZhS2pPTi8rMnpZeVoraGNrd2RieTJ3?=
 =?utf-8?B?ZmJzdGcydmJYYUJXZUJiOFRIYi8zOU1RYW1rQ01tMEl1UlkrMTFETFNHQ1la?=
 =?utf-8?B?MUorajdZdzJuNnR5T3JaK3ZnbFFpK1luVlVNQnJNbE5hSEVaalI1SzlZN04r?=
 =?utf-8?B?dnFBYnkyeXJXcnNBS0VWbW9rd3B2N1hmcU5ucDZyVDBGWElsd2ZGcDBKTVZW?=
 =?utf-8?B?SUxTa1M4MjQyL2x2V3k0RDRXMFlDa1poYklQWTFvbmRSdTVsRTY3SS9lUklv?=
 =?utf-8?B?QWFnMDlVTWl1anhySlhLWmpiZVV5alN5Nll3R2g1TUhsZVNkdUVIMlZaeEpq?=
 =?utf-8?B?enlDcUlUOXFYYmNyajRGLzdJQ1hLRGZDL3d4Qllub1UrZ1NSdExmbFZqSjAz?=
 =?utf-8?B?NGhVUjB2NGp6N3pRODB6am02SHdKaWZWaGVkUitKSXZoQjNtYjhMZkUrVThH?=
 =?utf-8?B?ZVg3VW1TWlhRYVJ5ZXdUelVHU0lzSGV3S2lKMTdQVkl6aFErUEdmaWliUHpX?=
 =?utf-8?B?WVhvSUE2NkNCYmRBM0MxLzZsa2NRaldxWEZFUC8rNzI1SzVGZnYxM1kvMjQ3?=
 =?utf-8?B?clBTZXlMZERrZDVJZWJicEpOVllRckFrY0pPQ3hndWVVK0VERGIwY1l0QVRu?=
 =?utf-8?B?VEg1a0VIdUtLTnEvME1lcXJENGloQmU4N2l3TGYydzh3eWh3MEFKQW8yM0RX?=
 =?utf-8?B?VWp5Zm9vL0FLZ0VnYTdMaWhQS3cvbktDcXNONEZtQkZCWFM0cG1rMGNqblA2?=
 =?utf-8?B?WmxvVHFFTWJuT2NTZHJtMTZic1lMbGtQckZJODd1MU5KUHdnVy9XMUpzQUFI?=
 =?utf-8?B?eWZiUklQM3BjZW1iKzRsc0FUY0hDYys4WUEwZlpZYmM3cWZmYXAxcmFsVUJL?=
 =?utf-8?B?aHFrS1UzaWcrOEFrZEgwT0s0YWxGRVJSaXlBQk43MGlLYWFDeDJpSURzZnpL?=
 =?utf-8?B?b2hpUU9oc2FYeUh4eHhpaDBldjlpOWM3OG85WkJ2cTU5elFVaW0ydGRnUnU2?=
 =?utf-8?B?clQzaW55ZVJ3L0lPOTN1dHR4dFE0SEoxbDhteFFkd0c4b1pQaU9jSW5WYWt6?=
 =?utf-8?B?UUl2SmZMaFE4WWhKa0pPV1JBdG9mbVBKdzNVM2U3eFNudXFCWXljTnFNNWlN?=
 =?utf-8?B?enRtLzRjdGtCU296S2NZQ1pVcnNZbHRHNWp3V09EWmZPRGR3MHBHbStoR2Jn?=
 =?utf-8?B?Q2VDL09USCtGMHM5N2tPVmdyQVlYU2dCQXlwVEJ3MFZDbVBGRHAvcis4Uzl3?=
 =?utf-8?B?aHMwUXVPNkhEZ3hienVaNlZxR2pCZjhmUGpndDVxWnIyOC9DS1YxZWVLcFd5?=
 =?utf-8?B?MERockJzVE8rQTFsZFIxenZwN3k5RWpiZldYR1dkVWRSZGtuREFFTXgzMEtm?=
 =?utf-8?B?OW1GMTMreFJ6bktrWWN6eEM1R2JvYnVrcC92MVM4RlNIZjFSWGM2NFJHaXZZ?=
 =?utf-8?B?VW5wVmE5bnhXUDdCb2U2STV0TEZlUEtXdUp4OTRBRGlPK2ZUbEVmMmU0aWY3?=
 =?utf-8?Q?J/4u7I9LY9wVrtGGKqN2hFrI1?=
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
	qRwbt6gNHzZ3v/ssKQW+6aDZqgwzyt5Mkmov97Ge0ck5s1N4BjNqfd2sTR000/Ucz+BafQLR2FA2rbSe1OFnYzlFaUz70BA/sbWzLU6Lu7Bw0AMvcTBuUiHdpD6SLsW0h2jMq0xMTvL3r5LsdkJYoimTYVdPce8thjtiixHvfmtx7UZfSNERSfuRMf6IZ2AzCQuqS2TPxxmTbPumisYZZaTV64UoF+VP2FquvT6aR2+1DavYUOBgSuS3QvQRaP7hmSenRH2ZauPSMJwiVOBepAr2ANiWNSffw9C8BlLUOJihfZWHjv0yjgbLsf5Vz5+6iewx4kxYVtHFL2kH35KobNI0W0c45ZjJNB4iMT1tfmZ6CTj8rnZBLhVxE/RQqL/pD06LAtzWIr/GBw9Q3R+Wx1S/jEVz/MovZYgCtzMaM0Ucp3JdpV0kua+jBOBH0DZfXojWz74sk0RzXSnZpGaw+oc7eFVwqaGqp2IqeMoIbEJWvZKp90SWtr4G8D1f8WsfyypadxLQoupe0IFd+kuohZUJ0fZhaIfjeIQ4rnO9ZDhkQsSGzXopCRf1WqOwCMtIKxc80Xq/z4GEgc0ILxymQj/p+XnEp0//5Ll5U7JS1n1gtHh0rD3T5CyQCA2FeN2V
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6575.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b06ba11f-e087-49b7-6689-08dd3eca2c25
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2025 12:00:20.1265
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cV5zUdLk8G+O2olT7f7JkLw9eKPhu5W77uTlhTzh3FUfVL+BdbJyFoQGMcCXbYZGvYTSywveQ+J2LCb+OyZjDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB8515

PiBIaSBBdnJpLA0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gT24gU3VuLCAy
NiBKYW4gMjAyNSBhdCAwNzo0OCwgQXZyaSBBbHRtYW4gPGF2cmkuYWx0bWFuQHdkYy5jb20+IHdy
b3RlOg0KPiA+IFRoaXMgY29tbWl0IGFkZHJlc3NlcyBhbiBpc3N1ZSB3aGVyZSBgY2xrX2dhdGlu
Zy5zdGF0ZWAgaXMgYmVpbmcNCj4gPiB0b2dnbGVkIGluIGB1ZnNoY2Rfc2V0dXBfY2xvY2tzYCBl
dmVuIGlmIGNsb2NrIGdhdGluZyBpcyBub3QgYWxsb3dlZC4NCj4gPiBUaGlzIGNhbiBsZWFkIHRv
IGEgY3Jhc2ggd2l0aCB0aGUgZm9sbG93aW5nIGVycm9yOg0KPiA+DQo+ID4gICAgIEJVRzogc3Bp
bmxvY2sgYmFkIG1hZ2ljIG9uIENQVSM2LCBzd2FwcGVyLzAvMQ0KPiA+ICAgICAgbG9jazogMHhm
ZmZmZmY4NDQ0MzAxNGU4LCAubWFnaWM6IDAwMDAwMDAwLCAub3duZXI6IDxub25lPi8tMSwNCj4g
PiAgICAgLm93bmVyX2NwdTogMA0KPiA+ICAgICBDUFU6IDYgVUlEOiAwIFBJRDogMSBDb21tOiBz
d2FwcGVyLzAgTm90IHRhaW50ZWQNCj4gPiAgICAgNi4xMy4wLXJjYXIzLWluaXRyZC0wODMxOC1n
NzVhYmJlZjMyYTk0ICM4OTYNCj4gPiAgICAgSGFyZHdhcmUgbmFtZTogUi1DYXIgUzQgU3RhcnRl
ciBLaXQgYm9hcmQgKERUKQ0KPiA+ICAgICBDYWxsIHRyYWNlOg0KPiA+ICAgICAgc2hvd19zdGFj
aysweDE4LzB4MjQgKEMpDQo+ID4gICAgICBkdW1wX3N0YWNrX2x2bCsweDYwLzB4ODANCj4gPiAg
ICAgIGR1bXBfc3RhY2srMHgxOC8weDI0DQo+ID4gICAgICBzcGluX2J1ZysweDdjLzB4YTANCj4g
PiAgICAgIGRvX3Jhd19zcGluX2xvY2srMHgzNC8weGI0DQo+ID4gICAgICBfcmF3X3NwaW5fbG9j
a19pcnFzYXZlKzB4MWMvMHgzMA0KPiA+ICAgICAgY2xhc3Nfc3BpbmxvY2tfaXJxc2F2ZV9jb25z
dHJ1Y3RvcisweDE4LzB4MzANCj4gPiAgICAgIHVmc2hjZF9zZXR1cF9jbG9ja3MrMHg5OC8weDIz
Yw0KPiA+ICAgICAgdWZzaGNkX2luaXQrMHgyODgvMHhkMzgNCj4gPiAgICAgIHVmc2hjZF9wbHRm
cm1faW5pdCsweDYxOC8weDczOA0KPiA+ICAgICAgdWZzX3JlbmVzYXNfcHJvYmUrMHgxOC8weDI0
DQo+ID4gICAgICBwbGF0Zm9ybV9wcm9iZSsweDY4LzB4YjgNCj4gPiAgICAgIHJlYWxseV9wcm9i
ZSsweDEzOC8weDI2OA0KPiA+ICAgICAgX19kcml2ZXJfcHJvYmVfZGV2aWNlKzB4ZjQvMHgxMGMN
Cj4gPiAgICAgIGRyaXZlcl9wcm9iZV9kZXZpY2UrMHgzYy8weGY4DQo+ID4gICAgICBfX2RyaXZl
cl9hdHRhY2grMHhmMC8weDEwMA0KPiA+ICAgICAgYnVzX2Zvcl9lYWNoX2RldisweDg0LzB4ZGMN
Cj4gPiAgICAgIGRyaXZlcl9hdHRhY2grMHgyNC8weDMwDQo+ID4gICAgICBidXNfYWRkX2RyaXZl
cisweGU4LzB4MWRjDQo+ID4gICAgICBkcml2ZXJfcmVnaXN0ZXIrMHhiYy8weGY4DQo+ID4gICAg
ICBfX3BsYXRmb3JtX2RyaXZlcl9yZWdpc3RlcisweDI0LzB4MzANCj4gPiAgICAgIHVmc19yZW5l
c2FzX3BsYXRmb3JtX2luaXQrMHgxYy8weDI4DQo+ID4gICAgICBkb19vbmVfaW5pdGNhbGwrMHg4
NC8weDFmNA0KPiA+ICAgICAga2VybmVsX2luaXRfZnJlZWFibGUrMHgyMzgvMHgyM2MNCj4gPiAg
ICAgIGtlcm5lbF9pbml0KzB4MjAvMHgxMjANCj4gPiAgICAgIHJldF9mcm9tX2ZvcmsrMHgxMC8w
eDIwDQo+IA0KPiBOb3RlIHRoYXQgYWZ0ZXIgIltQQVRDSCB2MyAxLzJdIHNjc2k6IHVmczogY29y
ZTogRW5zdXJlIGNsa19nYXRpbmcubG9jayBpcyB1c2VkDQo+IG9ubHkgYWZ0ZXIgaW5pdGlhbGl6
YXRpb24iLCBJIG5vIGxvbmdlciBzZWUgdGhlIGFib3ZlIEJVRygpLCBzbyBJIGRvbid0IHRoaW5r
IGl0J3MNCj4gYSBnb29kIGlkZWEgdG8gaW5jbHVkZSB0aGlzIGxvZy4NCkRvbmUuIFdpbGwgcmVt
b3ZlLg0KDQo+IA0KPiA+IFRoZSByb290IGNhdXNlIG9mIHRoZSBpc3N1ZSBpcyB0aGF0IGBjbGtf
Z2F0aW5nLnN0YXRlYCBpcyBiZWluZw0KPiA+IHRvZ2dsZWQgZXZlbiBpZiBjbG9jayBnYXRpbmcg
aXMgbm90IGFsbG93ZWQuIFRoaXMgY2FuIGxlYWQgdG8gdGhlDQo+ID4gc3BpbmxvY2sgYmVpbmcg
dXNlZCBiZWZvcmUgaXQgaXMgcHJvcGVybHkgaW5pdGlhbGl6ZWQuDQo+IA0KPiBXaGljaCBkb2Vz
bid0IG1lYW4gdGhlIHVuZGVybHlpbmcgaXNzdWUgbm8gbG9uZ2VyIGV4aXN0cy4uLg0KRG9uZS4g
V2lsbCByZXBocmFzZS4NCg0KVGhhbmtzLA0KQXZyaQ0KPiANCj4gPiBUaGUgZml4IGlzIHRvIGFk
ZCBhIGNoZWNrIGZvciBgaGJhLT5jbGtfZ2F0aW5nLmlzX2luaXRpYWxpemVkYCBiZWZvcmUNCj4g
PiB0b2dnbGluZyBgY2xrX2dhdGluZy5zdGF0ZWAgaW4gYHVmc2hjZF9zZXR1cF9jbG9ja3NgLiBT
aW5jZQ0KPiA+IGBjbGtfZ2F0aW5nLmxvY2tgIGlzIG5vdyBpbml0aWFsaXplZCB1bmNvbmRpdGlv
bmFsbHksIHRoaXMgaXMgZm9yDQo+ID4gZG9jdW1lbnRhdGlvbiBwdXJwb3NlcywgdG8gZW5zdXJl
IGNsYXJpdHkgaW4gdGhlIGNvZGUuIFRoZSBwcmltYXJ5IGZpeA0KPiA+IHJlbWFpbnMgdG8gcHJl
dmVudCB0b2dnbGluZyB0aGUgYGNsa19nYXRpbmcuc3RhdGVgIGlmIGNsb2NrIGdhdGluZyBpcw0K
PiA+IG5vdCBhbGxvd2VkLg0KPiA+DQo+ID4gRml4ZXM6IDFhYjI3YzljZjhiNiAoInVmczogQWRk
IHN1cHBvcnQgZm9yIGNsb2NrIGdhdGluZyIpDQo+ID4gUmVwb3J0ZWQtYnk6IEdlZXJ0IFV5dHRl
cmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+DQo+ID4gU2lnbmVkLW9mZi1ieTogQXZyaSBB
bHRtYW4gPGF2cmkuYWx0bWFuQHdkYy5jb20+DQo+IA0KPiBTZWVtcyB0byB3b3JrIGZpbmUgb24g
Ui1DYXIgUzQgU0ssIHNvDQo+IFRlc3RlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCty
ZW5lc2FzQGdsaWRlci5iZT4NCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAt
LSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtDQo+IG02
OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBl
b3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0DQo+IHdoZW4gSSdtIHRhbGtpbmcgdG8g
am91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UNCj4g
dGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxk
cw0K

