Return-Path: <linux-renesas-soc+bounces-13755-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 804A7A47B77
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Feb 2025 12:10:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5337169C4D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Feb 2025 11:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7A5E22D7B8;
	Thu, 27 Feb 2025 11:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="q0LdaYyY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010018.outbound.protection.outlook.com [52.101.228.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C8122D4D3;
	Thu, 27 Feb 2025 11:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740654403; cv=fail; b=HYrs5Xg+xVKZEFurpEKCusEI+uzjsHTo0hiPWpv5sVaAnfGkBApjJWqsgeZjeBEem/drlleB8ozCdIIdtXsD0xy2amx2a88I18DX9/35SLY1esFfytcTh6doYfyFyJactU1gO/c3w8xYgBe6eLcxdJ+MbFV3biBgtSGWui2CcFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740654403; c=relaxed/simple;
	bh=Xg6ugwvuKGeyEIqivdA+VHrDCG5FSh8xzCJ0bsm+knI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mRL0HVR/97HtfAT0MTlv0JbiBlUhYzIHfDuFEK14PvnkP5sq4c7NjEWW3WWpbhBLuQbp2+neEXjXKus1FM9WCTOdzjuVF1fsOkASIETAn+seb1Ewh8/9oAC+9UhONj69U/lAE35Ggqhf0uBOVLmi3cvNbc6IuEqyuYi0tZPoEak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=q0LdaYyY; arc=fail smtp.client-ip=52.101.228.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cJK9ystq3DCbYyjeGnWS1/RQNmWofoNPtrvDs5HRRlZL0krMe4K9802UA82n/Xn671gIwlSWBo+jP6QzHoezFXcwy34ZqLH6MufH1FzgsP6wvc+Z+xm8xPw3EHGGioX+9CU2oopzkR4p5jlmc2vxM1a6GLIibBTB8aSThaymb0xmEcUh06Bz+jWd8SePwtqloy+iaMpkKnRotMochWKyYcpjXG5xO2xm7nfcyIt4Hm8dEjEtx33RgrRScIOrSKOeIG1YBJi+Ukg4v2sbEtexaQzGlHD2q2H66d9cQ578aJXcfs8I/X+fv8dKTG4cARFAg/n6t/WW5iBbem1nMKcMow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xg6ugwvuKGeyEIqivdA+VHrDCG5FSh8xzCJ0bsm+knI=;
 b=EcqajLE9EEb8mQKs3NtZDzuTjLfOf30D4fftxITzMdurH/GMyRmEUET465NGA5LP010ohhSEqLU65Kd2wJUslEntIRGqI5L5PqCW2UXMHGq1/2Mqz9pZ/8HL7gUXX3o1+VJCvS4U4/4jgKd7pE0zjFNnoID0317AoUzcwEDc/vYre6oB7CadxI1KOUGJscXH5D+dZ58MfoBILvb8omkVvJ5DOiSsSvQCoJHNXARTHUJqqwFAyj5nzPMivbkNLk07chrVQ246qw9Vcoa7P4mFL21vCqZXzuCqUkPnY8kRTQDBkK2aOz5Wa2IRF2AmXd2VVTDHqZs+I9aEsgXT1THU7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xg6ugwvuKGeyEIqivdA+VHrDCG5FSh8xzCJ0bsm+knI=;
 b=q0LdaYyYhLrzH0Kv5KSwa7h25GLLgZnYKAGPz9QLKtm49VZX+KZFc108tyVpblHf1AdYuOQ3kvk4qTc45qSbipKfxzqlFbl8ne03C5gcQXwwDyXqOneGoutrXiGAeIhdX+7BHm+58BB7XIP++wrE+rsGuZfmbXmDsFX/L2LZJ/w=
Received: from OSAPR01MB2772.jpnprd01.prod.outlook.com (2603:1096:604:4::9) by
 OSCPR01MB14313.jpnprd01.prod.outlook.com (2603:1096:604:3a4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Thu, 27 Feb
 2025 11:06:37 +0000
Received: from OSAPR01MB2772.jpnprd01.prod.outlook.com
 ([fe80::7280:12fa:872f:e753]) by OSAPR01MB2772.jpnprd01.prod.outlook.com
 ([fe80::7280:12fa:872f:e753%3]) with mapi id 15.20.8489.019; Thu, 27 Feb 2025
 11:06:36 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Rob Herring <robh@kernel.org>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "rui.zhang@intel.com"
	<rui.zhang@intel.com>, "daniel.lezcano@linaro.org"
	<daniel.lezcano@linaro.org>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>, "lukasz.luba@arm.com"
	<lukasz.luba@arm.com>, "rafael@kernel.org" <rafael@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, Biju Das
	<biju.das.jz@bp.renesas.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "john.madieu@gmail.com"
	<john.madieu@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>
Subject: RE: [PATCH 3/7] dt-bindings: thermal: r9a09g047-tsu: Document the TSU
 unit
Thread-Topic: [PATCH 3/7] dt-bindings: thermal: r9a09g047-tsu: Document the
 TSU unit
Thread-Index: AQHbg6wEBHvU/a0YLUuj007LSYfAeLNQkMUAgAkvQZCAASe6gIAAHztw
Date: Thu, 27 Feb 2025 11:06:36 +0000
Message-ID:
 <OSAPR01MB27721284D1D4AD91C7E15621FFCD2@OSAPR01MB2772.jpnprd01.prod.outlook.com>
References: <20250220152640.49010-1-john.madieu.xa@bp.renesas.com>
 <20250220152640.49010-4-john.madieu.xa@bp.renesas.com>
 <20250220191718.GA3642117-robh@kernel.org>
 <OSBPR01MB27752329B962BAC78F341440FFC22@OSBPR01MB2775.jpnprd01.prod.outlook.com>
 <CAMuHMdU_HrPiw_Fh2KS8A0_=sJ=c4RrxTBWomp8HpRSEMXLeAA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdU_HrPiw_Fh2KS8A0_=sJ=c4RrxTBWomp8HpRSEMXLeAA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSAPR01MB2772:EE_|OSCPR01MB14313:EE_
x-ms-office365-filtering-correlation-id: 28eae1bd-117e-47e8-cc46-08dd571ecdac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VjQ5UEVLY3VPOXpYZFJsT2xNMlFWOFpnWlRJeXZrNHZiKzlMVGNzTDBHTEFo?=
 =?utf-8?B?bm54d09JS214M0d5WEVVZWcwVnRhWW5STElvWVEybWVFUjd4TkFiMlFDcGNE?=
 =?utf-8?B?V3NvYUJDWlkwOGREcVZUMUkwVWNCWXpvT0taaHBobVZlcWt5ZDhTcDMwK3F5?=
 =?utf-8?B?SEIva2Urc05Mb0hDYXJGQ0l6TGZWUjRyOUliSlBPbDR5WXRCclIrNWduSnZl?=
 =?utf-8?B?T1NPSGRnVkw3c1BCNGhlVE50RlVDZzl2aUYyR0doRThaMHFpalc0ZDdxS0N5?=
 =?utf-8?B?ZW9lMkpqWjVOVHVTcDRXbmpQTWRJSFIrLzk0SVFmcW93aXFjK20wMTVTazlI?=
 =?utf-8?B?VWtpb216blFuQW0rOGhhY0l5aXZ2dDRvSFRHWGRkK0RINUtCcU56azVXTldH?=
 =?utf-8?B?UjUvKzVWZW1Fa0xRZms2eXNkcmZvb0RlNFZyRWVHSUhJY21iU2RHZUxGZjNI?=
 =?utf-8?B?d1pJMlh5K0JCa0NQNDZGMGV3VXhtZk1IbjRETVRVaWdzc0JtaDl2YVVSTm03?=
 =?utf-8?B?RkJacEw3bU5CWGtLUFhBU3JLZkIvSDY5UWhITFFsdElpb1JWM1dySVhKMndZ?=
 =?utf-8?B?Qm1LdnRIR3hJbEUwcTA4NklrWmJrOHVKZEROZEZBQmdsS3dta0djSHJBTzhX?=
 =?utf-8?B?S2ZMTHFPUU1XMi9URTNkS0c2Kyt3cnFQMFMxQlljTDJmTFdLb2o1aWYyQ1BU?=
 =?utf-8?B?dWN4d0RYUGlLM2RUKzVReW9BZEt6cFJ4L3FmbFRvNU4rL045eDM5c283cWxU?=
 =?utf-8?B?ZmJpM1I0QlYxRFliZDc4YnlYVmFjWnNHSTBSQTlNVlVPdzQ4b3hqVXdmb1c0?=
 =?utf-8?B?cjZuWFFLNVIycFBSMEg1Z2MvQ2Z5cXMvdkxuZXhIOUxTa2MzUDR1SEVacDB5?=
 =?utf-8?B?MkR5TnZvcjBoUEhsSHUvN0hPVkw0ai8rL1BBNjEyanVHZFNDL1lrbGc3R0Vm?=
 =?utf-8?B?SXdRMHRLZm0rRFRwdHZncmZ6S09ZRVFjMS9qTkNEM1FmdGxWcURDVVV6WHBk?=
 =?utf-8?B?cHBKc05mRHd1VGJHbzNkRkFjN2VvdUI0TWRVVUg2c2wvaThPN1pYbko2WjBx?=
 =?utf-8?B?NlNzQ3AwVGNWdlhEbUhMdVUxeDAyRDJ2L3VWU2pML0pMS2pVY3NTYzR2Y3c1?=
 =?utf-8?B?NVc5ZDRMcVR2VzBhS29oQWlVYXdCWGJQN1lzTytKZzVVY3hnZWd3cW1NR2Vy?=
 =?utf-8?B?MEtoRThkZGNuUm81Q0xKMkRlZzBqdzA0RWhqek1nTER4UjdCVnRUTXdnM3My?=
 =?utf-8?B?QlVLc2xRRDRGNGFiL0hKbkh6eWthQXNuV2VFWFB3MFlHTnF4T1VlenpJa1JT?=
 =?utf-8?B?MlR4VzBuZEtKd2ZseGY5RzZmQlU2YkM1dllhd3ZFeGdPbHZYT3JHUEdvc0pN?=
 =?utf-8?B?Z3JHQUdMaWlJVWQvWW4rU09ZRjdIQ1VTOFQ3WHFFVzBwakFWbW1mb0tydHht?=
 =?utf-8?B?aHZwbFZuenZOaDZlcDhCR2FnWVdOVXc4THZPUXJWa0VxSmtMdmJLQXg0T3E3?=
 =?utf-8?B?bDFSL01pREJndnFocFFNZHdPdHhUdXNORitlc0VHdlN4TDBOQjZkQ280dld3?=
 =?utf-8?B?WkRhVC80cU9uNFhlVWVoOWhIaS9ZdUQ0bjQ3MXFuVUJFK0N1ZzJNWVluaTBl?=
 =?utf-8?B?RGJIWDZFeEMrQ0JMT2pRcVFLVXRCeU85Zm5iRVdJcTU3MEtEZDN0SWhDWWdI?=
 =?utf-8?B?YzNlK1Y3TGpZS0FkNGFENFd3ZVpkalNZejI4T1BDOG5WcXA4a1Z0S1FtSkQ4?=
 =?utf-8?B?Y3Fvd3JtMkU0eUhCNUFuU1h5eFhQYURTVkQzdyt0RzRDdkN4OUIydnorR1FN?=
 =?utf-8?B?N1YvamsxRWM5UGg0Q2VlNHAxN2ZReE1ZTTRjTHdQZzA4ZDlsZ09KRUVaTndX?=
 =?utf-8?B?b01oTjdvazduUTEzdVBXZ2ZTNUJHNUl5dXBzMThwRFM1WlROSEppc2VObWxm?=
 =?utf-8?Q?O1IWh4qbUb6zsbPjW30G4Sh1SFxzDlY1?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB2772.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eGlPRk5mbG0zU3Znd3JEUU9sTGphVk5kS0REaEswdmtDRjhzU0ZVMzZvMncx?=
 =?utf-8?B?WFRCeUhtOGFUWUI5WUIvZVVhdHo1ajRBUUhEd0hlUWt1OUlrUTlsNDN5NDVl?=
 =?utf-8?B?Q0N2ODRUZ3p1Ym1VWGV4ZG1GVjREWXVjMnpOUmtCR29uai9TMThYUGdjdjJS?=
 =?utf-8?B?NHRGV28rUm1PUWpNeWlPYVAydHRkdWpHTmNHZ1UxVTRpdXVDZ2NNQUtnZWNi?=
 =?utf-8?B?bExodzl0bVNGbnhhV3M2SWN2bU84NE9HYmpaeFIyc1c4Y3BSWHVMcC9OT3pS?=
 =?utf-8?B?dlVjd0wxL1hHdU5Rek5mVFpJSHVhRjhmaFRiWFh2N2ZYVDZNVlBNeGdLYm42?=
 =?utf-8?B?V254azVZeC9Yc0NGTDVaaTJQSWJNSFV6azk1eXhuSFZ4N1NHaW5nbWd4Q1Ji?=
 =?utf-8?B?N0pkaWJaVC9tS3g4R2t5THEyV1JMczRUWWI5V2dOTW1xdm4zdU9EdWlWay9w?=
 =?utf-8?B?R0l4WFplbnY1dkEzMHdjbis2YjY2RnpWVzdmRC8xRWl3dXJoQVRrTFVFTVN4?=
 =?utf-8?B?bUZCb3pGZmhOZXozOEN4STlVRWRCSDIrencvL253V2FtcTRvUXNBOUI0d2tJ?=
 =?utf-8?B?UUo4c1EwOStuWXBacXhEcC96L2dEcThQNnhRUHB2N0tVNmNFNU5PY1UwNTVS?=
 =?utf-8?B?MytnSk1KWjJtRWV0M0lvUlZBQUFRQjhKM0tPeGIrL0YzaTNtVDB2ZmlOVlZR?=
 =?utf-8?B?MDJHT3E3bVhZQXMyTnhDUDRvcks3VFVuRjUvcTJDNEdqL0l1ajRTdEFjUWtC?=
 =?utf-8?B?bG5EcExteU1PVmFDcnJCdmgwOFhjc3c0TmdnQ1d1cDc3VHJ4RGZ3ZEtXeE8r?=
 =?utf-8?B?Um1nT3NlMWd4OEtOSjJkMDZPcHRMdVV2REtHby92NStkSWVqc25va0hHWGVq?=
 =?utf-8?B?RE5vdUx4ejl5RWdMNlV2UENRU1l0TytIeHB5NlpUVDc1OHg2SmhiVnFPbzBY?=
 =?utf-8?B?bWhRMG5FZDM5M29oZTFhRTl0K2N1NFhnR2JvSkhOWmlmbVZhbUZmNHE3TWRF?=
 =?utf-8?B?K0tjUjdaS1hzRkdTWmlLYzBUb3MrR280UUhSbzJVVWhkRnkrbmZSVFBrck5l?=
 =?utf-8?B?YVJBYUREWTlORnBOZFY5bkUybUFJbUFCTVRpNUxNQ1pOOFB3amFsT0xWcnRv?=
 =?utf-8?B?SzVKUEE2cEdaa2xNUk1FaUNSUmNvWS9wNjZUR2hQK2hwWHdSRWpqUHB1aWRU?=
 =?utf-8?B?ZVZRTFF6ZkovSHl3V2lmLzBwUzdmbHR2eE1jemZOUTM1RjEwOWl2M28rMjNw?=
 =?utf-8?B?UnRjRTdKdlh2QmI3dVVKTi9kbmRERXJjbHlOWkQxcVQwZEZhcmxxbDB6Q2hH?=
 =?utf-8?B?YUZ0TlRtNTVUMS9sd2pwZ2xheDVITldNSWw2dGhIejduZDgrVE9wN1FJTDdu?=
 =?utf-8?B?SStWdUNJak5qU3VwcEtTdFJ2SXI1NGoxOXlSQlpjMkt0U3I2L2JqWXlyVTFW?=
 =?utf-8?B?eXNEMUEzMUR0R0oxWG55a1I0UDNyWi8vQ2FVbEhYbk1Ib2JDWitlTnlRSGNn?=
 =?utf-8?B?WU9KUGxGS21IajZlbjJBUWx2Zm5QblBYZGlrcWRqUWw5R0tMQ1E0Mm9lcldU?=
 =?utf-8?B?RW9Kc1c1cXM5VEJhNDRna2JMYU5aWEV1R1UyNFJsYUVDMkZjN0xSZW1JWURE?=
 =?utf-8?B?bnd1Yk96MzErV2lBYXROSEFxU2pEOXhscS9qUk9LZWhKeldpcjUvRXh6bWht?=
 =?utf-8?B?N0FuZ1NiRmdjZVppMmlTald5Y1QxZFZqVHd2NXJxZGFwZUFmdVlCeE0vK1Br?=
 =?utf-8?B?S1dxNmpOQjBtMHpDOC9yRStFOFZQcjlBSDNrczl1eXI3SmFqUmwxYk5FVlFv?=
 =?utf-8?B?U2V0dURHZ3Y1eklTa0N4K0NzT0RzU3poOTd1TXFFZWQ2OXFjSmJCVnlYR2lH?=
 =?utf-8?B?VEJqTnZqOWk5OVl0TG0rcDQvcXY2a1lvTzJOZHhNMmRmS3A2aHJBVi90US9S?=
 =?utf-8?B?dDVOemd2Sk1WRzhQSEFMTnEyeE9ZK25OZlBhMzg1aE1GLzN2VWs2NWJDSGZ3?=
 =?utf-8?B?ZXB2Y3RPMGR0UG0zVU0wNEdQVWduV1lXL1M2SXIrZjhVUGwzOTh5K245UlhZ?=
 =?utf-8?B?ZklEWFhqWXlOWURXUklOblduNjM1RDM2cGkwZFE5bTlnK3NMQUNGV0h2K2Mw?=
 =?utf-8?B?SHNHZjZmRy9QTjdlUGcyTTBTKzJOWW8zT0FOKzRYQlpCZi85T0pPb05QU1Vw?=
 =?utf-8?B?UWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2772.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28eae1bd-117e-47e8-cc46-08dd571ecdac
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2025 11:06:36.7594
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SXi1g9ufB4gc5Y6ugvGgI1VbBD3KKILTUSN3GAYtHFxQ1NglxaRKqecJZN7tpQptVVUtR8Atv/FxG0WsEZN7ejmSDrP20IAcTxKkSVdrTLc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14313

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgeW91ciByZXZpZXcuDQoNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhr
Lm9yZz4NCj4gU2VudDogVGh1cnNkYXksIEZlYnJ1YXJ5IDI3LCAyMDI1IDEwOjExIEFNDQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggMy83XSBkdC1iaW5kaW5nczogdGhlcm1hbDogcjlhMDlnMDQ3LXRz
dTogRG9jdW1lbnQgdGhlDQo+IFRTVSB1bml0DQo+IA0KPiBIaSBKb2huLA0KPiANCj4gT24gV2Vk
LCAyNiBGZWIgMjAyNSBhdCAxNjo0MCwgSm9obiBNYWRpZXUgPGpvaG4ubWFkaWV1LnhhQGJwLnJl
bmVzYXMuY29tPg0KPiB3cm90ZToNCj4gPiA+ID4gKyAgaW50ZXJydXB0czoNCj4gPiA+ID4gKyAg
ICBkZXNjcmlwdGlvbjogfA0KPiA+ID4gPiArICAgICAgSW50ZXJydXB0IHNwZWNpZmllcnMgZm9y
IHRoZSBUU1U6DQo+ID4gPiA+ICsgICAgICAtIFMxMlRTVUFESTE6IENvbnZlcnNpb24gY29tcGxl
dGUgaW50ZXJydXB0IHNpZ25hbCAocHVsc2UpDQo+ID4gPiA+ICsgICAgICAtIFMxMlRTVUFEQ01Q
STE6IENvbXBhcmlzb24gcmVzdWx0IGludGVycnVwdCBzaWduYWwgKGxldmVsKQ0KPiA+ID4gPiAr
DQo+ID4gPiA+ICsgIGludGVycnVwdC1uYW1lczoNCj4gPiA+ID4gKyAgICBpdGVtczoNCj4gPiA+
ID4gKyAgICAgIC0gY29uc3Q6IFMxMlRTVUFESTENCj4gPiA+ID4gKyAgICAgIC0gY29uc3Q6IFMx
MlRTVUFEQ01QSTENCj4gPiA+DQo+IA0KPiBUaGVzZSBhcmUgdGhlIG5hbWVzIGZyb20gdGhlIHBv
aW50IG9mIHZpZXcgb2YgdGhlIGludGVycnVwdCBjb250cm9sbGVyDQo+IChTZWN0aW9uIDQuNiBJ
bnRlcnJ1cHQgQ29udHJvbGxlciBUYWJsZSA0LjYtMjQgTGlzdCBvZiBJbnB1dCBFdmVudHMpLg0K
PiBUaGUgc2lsbHkgIjEiIHN1ZmZpeCBkb2VzIHNlZW0gaGF2ZSBhIG1lYW5pbmcgaGVyZSwgYXMg
UzEyVFNVQURJMCBzZWVtcyB0bw0KPiBiZSBhIERNQUMgcmVxdWVzdCBzaWduYWwuLi4NCj4gDQo+
IEZvciB0aGUgVFNVIGJpbmRpbmdzLCB3ZSB3YW50IHRoZSBuYW1lcyBmcm9tIHRoZSBwb2ludCBv
ZiB2aWV3IG9mIHRoZSBUU1UuDQo+IFNlY3Rpb24gNy4xMSBUZW1wZXJhdHVyZSBTZW5zb3IgVW5p
dCAoVFNVKSBUYWJsZSA3LjExLTMgTGlzdCBvZiBJbnRlcm5hbA0KPiBJL08gUGlucyBsaXN0czoN
Cj4gICAtIFMxMlRTVUFESTogQ29udmVyc2lvbiBjb21wbGV0ZSBpbnRlcnJ1cHQgc2lnbmFsIChw
dWxzZSkNCj4gICAtIFMxMlRTVUFEQ01QSTogQ29tcGFyaXNvbiByZXN1bHQgaW50ZXJydXB0IHNp
Z25hbCAobGV2ZWwpDQo+IA0KPiBTbyBJJ2QgZ28gZm9yICJhZGkiIGFuZCAiYWRjbXBpIi4NCg0K
QWxsIHJpZ2h0LiBJJ2xsIGdvIGZvciBpdCBpbiB2Mi4NCg0KPiANCj4gR3J7b2V0amUsZWV0aW5n
fXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2Vl
cnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBn
ZWVydEBsaW51eC0NCj4gbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMg
d2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLg0KPiBCdXQgd2hl
biBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBz
b21ldGhpbmcNCj4gbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IC0tIExpbnVzIFRvcnZhbGRzDQoNClJlZ2FyZHMsDQpKb2huDQo=

