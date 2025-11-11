Return-Path: <linux-renesas-soc+bounces-24455-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EE218C4CCD6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 10:58:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7BAA54FD1B5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 09:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E19F2F90E0;
	Tue, 11 Nov 2025 09:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="dZFuKBEl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010024.outbound.protection.outlook.com [52.101.61.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBFA2F3C39;
	Tue, 11 Nov 2025 09:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762854651; cv=fail; b=TCnK5R1x27LCTzPIVepeeI4V4lfYJVN/ZAM6Bz8ydywPTmi0/djZ/w1QDgHS6WjMKaomXoMCHXtRuoWdX+jLAV5JcCELWgNI7RcTTX2RyfgJLFQnfKlNbWnTdTx4Ys2E+FnQPe4pN2ZpG5nxazyZz7paoSMpeK010PXLLYtclzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762854651; c=relaxed/simple;
	bh=2wmnAhnqITzKwoq2WnMELtyFS0aszqkjhfHuva+OvQI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=s1ns0MpftusULpVhD4+uryqpAGWpz2EE8qkeZR+EhZyA0XMNXkzUgoXmJYnD8EM/dI2pHe86XyFdiLarF2NAD7yx8rBJSaxqkUlf/t1s5b6kEEEDreb6+b13M44WX/58MzD/jzSfdNgzLvTaMT7W0zvsKuCNB/h0GQ2NPuvOjeg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=dZFuKBEl; arc=fail smtp.client-ip=52.101.61.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yFf43F+apSl9JCXzigADeZxutjrLPNiyQx1WeC/TFhtX1PytJWC39pIP3Wtze4KT36xtLKh6toXe46E43sDpMDTgmJi5NE+Xcg4KAx3bkxsFEdmCynUZBJAWEooN0qfkgcxnWxFgvX+Jojs9GVRhFHR4YeYBP2gsp5kD52aINzKO8WLg6s3BcoMq7rXUPxX6g9U5heB9f2tP4MLttVEt5o01Qzqx66ZrcG3s/GD5gRmZB694DOnQcplQxMbMh4lR482RYUppcp6w7EB7ZK+o/34gtMSR3ObEN+l5TWAVkSbsKct7VaNQxIsOPAtI9NzS8hs+pKujnc/WPTLmDReOZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2wmnAhnqITzKwoq2WnMELtyFS0aszqkjhfHuva+OvQI=;
 b=Pype6Gy10B8LmVdV0SQYF8if7iuKgOzz/PJxfavO1peFTrTyBDH57O9UU5BLOmAJYK4tXxWGwwSvDp+kuvppnmEuB8EOUHrWeODnFMwSLCo7dkoPxh3xc8bldCPxk5CaAj4f4fpv+t8yJeq/56MexIu0zv+GjSkkh2BeWzow5Fcel5jlmr2eZl1RCEmY4B04OOn5MJya0rLtuFOrEKvihWDZrg9hSjtMcPgzphMzEVQCKXlpgdHZSaDLFhmrBNg5n1xXKE6ynmAhyxFKOhV9+LNouBobu4m15R+RpPk9LmSDiUdNkf65GF5Eb5+cZvEMVP0p4UXsIs78FgXhkDBxGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2wmnAhnqITzKwoq2WnMELtyFS0aszqkjhfHuva+OvQI=;
 b=dZFuKBEl2xLdGXmdyhv0Pzg2NLbvMqLViT3lMtBVYEoEymDWu2fdZ8KLkbHYU4UaX/d1wkT/6YF3MiT7Jn/4y4mQrih3MKfpoKdFA4BznqDAWvIueb2biB2NfkmJbGhQQSiyCURvl57hpYJsk22BwvMj8wM9x5ZOxA2EgNhaXg+rDtNNgFgRZWzBW3lga08rFkfGgO7UY7D9Ka32Uv/pmab6WLJjcEWL96LsLlY7yqGFt0t7+44ytYZqwonWzjRqK5a0qQW7Qnv5WkBTCDvSC/qguvRu6MJBBuGaz3jmz4Uz8KHcvEopQ8PN8JmOpnglFzyKfvYACBKodC7ttll11w==
Received: from SA1PR11MB8278.namprd11.prod.outlook.com (2603:10b6:806:25b::19)
 by PH7PR11MB6953.namprd11.prod.outlook.com (2603:10b6:510:204::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.10; Tue, 11 Nov
 2025 09:50:45 +0000
Received: from SA1PR11MB8278.namprd11.prod.outlook.com
 ([fe80::84fa:e267:e389:fa9]) by SA1PR11MB8278.namprd11.prod.outlook.com
 ([fe80::84fa:e267:e389:fa9%5]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 09:50:45 +0000
From: <Parthiban.Veerasooran@microchip.com>
To: <prabhakar.csengg@gmail.com>, <andrew@lunn.ch>, <hkallweit1@gmail.com>,
	<linux@armlinux.org.uk>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <Horatiu.Vultur@microchip.com>,
	<geert+renesas@glider.be>, <vladimir.oltean@nxp.com>,
	<vadim.fedorenko@linux.dev>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>, <biju.das.jz@bp.renesas.com>,
	<fabrizio.castro.jz@renesas.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next v3 2/3] net: phy: mscc: Consolidate probe
 functions into a common helper
Thread-Topic: [PATCH net-next v3 2/3] net: phy: mscc: Consolidate probe
 functions into a common helper
Thread-Index: AQHcUuvTyOWiQn9ndEuUf4I1nF3MxrTtO3SA
Date: Tue, 11 Nov 2025 09:50:45 +0000
Message-ID: <40e744b5-cc17-4b33-8d0b-1e9987eece7c@microchip.com>
References: <20251111091047.831005-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251111091047.831005-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251111091047.831005-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8278:EE_|PH7PR11MB6953:EE_
x-ms-office365-filtering-correlation-id: b04d7709-75f5-41eb-839c-08de2107c922
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?QzhFUDlXZ2llR0U5cnY4Y1dCUkZES1JGOXlhcFlpRnYrVzA1N0Q1WldqV0xm?=
 =?utf-8?B?eW5ud1FxWWx4RGhSMll2V1lPNGxBTzJrZ3J6RmxTY3U5cEQra1pmbFNDN3U4?=
 =?utf-8?B?RFBSdmRQZzltVzFEdGQ0SVlERlFMd2NySWdzTmxEN0hMbkNBWFl0ekpiMVph?=
 =?utf-8?B?UWlub2dKTDVCTUhFYlM3ZDNPcnhsQWlrcUtZSGp6aXF6NEhnbTByK3VMR1ZM?=
 =?utf-8?B?QXlVSXV3TmpFVmkvb1dncFJmazd2OHRPVXF6RjVIM3c4cy9wQlNhODcxWlFD?=
 =?utf-8?B?NlU0c0JuNjJseVdXNEdBRjdPQWUzNGE2Q0dLc09waDJ1THZTQlpkY3J5STdF?=
 =?utf-8?B?TGdBRUY2dVIwbHhLNmFkVXF0ZUUzalEvT0YycnV2aDJNb2Y0MWVFQXFjdVk0?=
 =?utf-8?B?TTBLWExjdjRxLzU4ZThMK3JFd0piL1RFOUhPWEJqcWNJN29iK1B2VEI2dmtN?=
 =?utf-8?B?a0ZzaUp4WGtveCtwbzVjUHZmNjZzbU9FWUVGQnpROXRPWGFnaUFXUnlJR0tl?=
 =?utf-8?B?TDdrbm54SHRYTGdOdmNrOU4rZEZPejd6VXNFMjJDdDAxeGtqWEdpTnF1ZFVK?=
 =?utf-8?B?eWJhR1ZreXVKOXp2NTVsK0hLbUFhYTVhMFdJcG1qZGlWU0hMaTd2REdPMC9W?=
 =?utf-8?B?akllektmcjVzbks0RktwL0J5UEVZUWdVTDBtbFRIUnZGZGpyeEN3Z3g1RlR5?=
 =?utf-8?B?YzJKcnVQZ1d0dUhCWG5JSnhVUFN6NjJtQ2h4U21sYlZrVnZBUVpmTzBaQnRJ?=
 =?utf-8?B?Zi8vM1NBazJyZjExaGI0d05EaDdJUFRqRmFkVzNLTDFCMGprdGMxSlM1Unda?=
 =?utf-8?B?L1hDdEtvMVFIOUtPWm4rUFBzekFnSjZUZzlMT0pVUHl5QWp3WVpIMGJBaFVz?=
 =?utf-8?B?bVFVVW9vRzNOQ1ppU2NKWEpwUGFQdlB0N1gxN1VQZ05tcFFMMmRSUHREVENp?=
 =?utf-8?B?cXpMK1Y5T29YVXZoSSs3ZHByR0x6bGwvam5lZENCT0g1UldJSGlPSWZWaHNI?=
 =?utf-8?B?YmdYSmo5bTRwTGhIazA3MjlFWnM0Z0ZRWi9MNDdWR0FVakExUld0NVMwSllE?=
 =?utf-8?B?OEMydElYUWJWYklyekp5Ynl1dUs4R1ZScitlaFl4T09ReDVOM1dRNmJHYVhY?=
 =?utf-8?B?UDJReTE0YWdFL2FsWTBzSk5acnVqR0ZzMzNKUW93ZmI2dGFiNVpPSWh6bDNq?=
 =?utf-8?B?MXJ2TDJHMlQ0Zm5LMy8vZGhrNG1kMXg1YVB4K21WeWJJT2NCNGNxRE9iMVBQ?=
 =?utf-8?B?d1lnQWNlU1Qzam9tNVVXaGM0YkVPSnBvN0FiWU5DajltTHh4KzA0U0lENU8z?=
 =?utf-8?B?dk80c256TmVtT1AwOXVPWks1OU1tcWlTc3JGK0NnaS85UnkvOXJnTUhKTTVx?=
 =?utf-8?B?MXdMcVcyZEVtWkNEMlo1Y0orVHJZSjRDeDkyYngwTEkzaU53blk0SldzNjll?=
 =?utf-8?B?YWQvSmdLT00vZnY1NmVjMjNLTVB4N2NSQVI1cFVvaUMxeVJRNG8xSWhZWCtY?=
 =?utf-8?B?d0pyaFV4cEpVYnJCNGZyZ2hZMUkzcGlrVkZVWHdxL1hlL09ZUTE1UlozWERW?=
 =?utf-8?B?Vjk4WkxzUWxMMXhOT0RSL05qc2ZxVU5HNFdENkRSMkt1Vk9FS2NsMGhmZkdJ?=
 =?utf-8?B?UDkzaTNWZVN1Q3Z5VjRXc3dGU2o5RUtRNmltc1MyVGh4NjNpS2hXdEIwR1Iv?=
 =?utf-8?B?Tnh6RTlNTnllTm5lUXRsZm1aczl6Mk9UazJFZ2hCbmNpRUZjS3dQZ1laZHU2?=
 =?utf-8?B?WE1BWXFBWnJSZndKRTRWR1pTRVR3OTFPdFg1UGp5dmk5Ynowd2c2VmxiOU9I?=
 =?utf-8?B?NjVRMEFONjZ0Vks5L1I2anlwY2xrc01OQVhUZi9pWlo0d0xuZk1tVDhTQkQ0?=
 =?utf-8?B?OWFQMGFBQXNjUFBtM25iS1pRcUUwV2JXRmFweS8xUFdNcFo0UE13M0NESmNs?=
 =?utf-8?B?L3psTnhlL1M0dTcwY2Z0Z083Tk9zbjQ0aEl5MkplZFUxZkZodUh6NlR0cTF3?=
 =?utf-8?B?TXV2R2ViUWZTeExUN3Urc2dzbTQ2VklDcDhPUVI4V0tCT2dPd1F5aS9Ha3Va?=
 =?utf-8?B?d2VJdkVJY05hUnBQVTJYeWN2bjJSWTZQZjh3UT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8278.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aDhET0xnbnh1SEtBOWg2TnpDZm5CTTRqNmsrWWt3amVvdUxDbTQrMEpEZTg1?=
 =?utf-8?B?RWhmdmJld3kzSlZCWk10T2ZEZU9hSXlpWDZ3WHordzMxdmFQb1NxL2x4bDJo?=
 =?utf-8?B?SStkWGJlWUQ3U3B2WTVVR3lIdVV4WU42RVVvaVMrN0JjWTROVGZJaUNBckgx?=
 =?utf-8?B?dEh5cGptMUFsbHdWNzlmL2VhTGsxOWNtc1hZWnh3RE1hRzVOYk5PS2s3UmNZ?=
 =?utf-8?B?K1Ayckt6Y1llZzByMlNZeEREZC9XQ2dhRWd4emJiWlpFMEg2TkJmNHcxREJQ?=
 =?utf-8?B?Wk1ic1ZkRW1HZWdJWTloL2p0dFVlQ0paMVV2VEg2VWRYTWg4SDFLREp3UzlL?=
 =?utf-8?B?dTJ4M0NTRVhqL3NXcFBSamZXRVl0bDl2bWdrQURVU3NlZU1HbFhyWTdHZGls?=
 =?utf-8?B?QkRQZy9DMXZ4NGhGTVk2Z0xjUzdMQXpTM1lYbUtuSUVZR0VSWjdCMXFiTVVk?=
 =?utf-8?B?Ly8wYi9tUnBQdGFoblVvWUNDVGdDYW9UNU5ON0FhN044SW1PSU9DN0djcEpB?=
 =?utf-8?B?VWZzMUIwQXEzL1pwY2V0cnJNYzBQRXpyU3EvMFBkWEp0bmFCYndFdEgxdlBR?=
 =?utf-8?B?VjgxbzA3Z3BRYXBJeFUvcUduV2ZmUlFLN1BkclJNbE1HQ2ZVYktsUWVXa2xu?=
 =?utf-8?B?V0s2RTNLUFBITmh4cnkzTFRaeEkzYVorQUdIcmFLSWxnbmdOSE1Ca3RYSWpM?=
 =?utf-8?B?dEovQnErTXdlbDJudk82WFpQMEpsSE1OOW44UmFYWkRCVklXOURWa0RFaG80?=
 =?utf-8?B?VkhTaGFDU3I4c2xXaHlDbkJZeTloNEh3Ti9jeVBCYUVsNXJ5ZVYybmI0VlN4?=
 =?utf-8?B?Sko4aTFRYTdtRUxWL3ZDYUVLMU1wYUx0Z3VicmcyanZ4K3g4ODVISUFDZzkw?=
 =?utf-8?B?NWpEdnVJYWd4ZDJkU2JhZDhtdVU2R0VOZHhLSVcvU0VzYm9wVEpTTGNSYTd4?=
 =?utf-8?B?WTMrYm5QUE55OVZuajVYbkJjZU9UakwwR0pwZUE4Nk9GUC9WRTU2SWJlSFB0?=
 =?utf-8?B?VUd1TTRZbi9hZ0M4WTJRaldNZGNMa3VVZ0dQSHd2Umg1d1NtYmhnQ0xVZllD?=
 =?utf-8?B?ekNieFdxTlpOb1o3S2FoTWE4Uk5sdUplTmxYYWR1YnZxL3dXMFI0bThhaE0x?=
 =?utf-8?B?bVowMXo0STFVU003ZVVGREYvc1FqNzcrM3VmSTRzNUJMeUNBNzhnNVVoV0li?=
 =?utf-8?B?WXg4S3BVenVmWmF5QWZRZ0t0WjFPanN5UHBPWnc0WGhuTnU0Z1dlVkgvLzlE?=
 =?utf-8?B?bTU3eXFVYmJnMWI1WmRDTnFlVFJJN2JWaWM5T1dXdUtDd0xzR2ozSVR0R1FZ?=
 =?utf-8?B?MFA0RTlOeU1IWnptenZUa2NnVWJEbmgrUTl5QW5aeDNlcERLZHVQSmRzYStM?=
 =?utf-8?B?Q3VMSFdDUzRONUZGalhQSDNZMng2aW50TURIN1V0QU1aTUppNlhqUk00aFpC?=
 =?utf-8?B?bG5Obzh2QUV3c3NtQXJFRlN2NlVQajdJYU91ZXpXUklPOStaMjQwSFZocEhh?=
 =?utf-8?B?UHVPc0ZWYk05MG5rdmIrcml2NGlCRTBtZUxZWDZ0emsyMXViVUdsdW5uYlRR?=
 =?utf-8?B?MElhcDdiaTk2YXBRd1V6ckU1a25RU3FObUp5cHM1cEpORWsyZS8wamh0Z1Fs?=
 =?utf-8?B?YllFM1l3S2RmUU8xT3ZxVzA3N1VGVmFzeXBXS2RtazBINDY3OC9ncE9VL3Ft?=
 =?utf-8?B?Vnc0clBBZ2hNQ2Q0N2RiYXJiZWRIT1BKWnBOeVZ5OWZuRVlzT0xlQXhSZ0Vo?=
 =?utf-8?B?Z1E4bTdkTm9HOUlPeklhVHZSbkJxcUp6YlpySDVoUjhVclVzeU12VDlGcXNx?=
 =?utf-8?B?Rmk2a0VQd0lpUzFSZzdWb01meHhMWnM4QlFLa1dKNjhuYTlHd29FcmF2NmRH?=
 =?utf-8?B?dlJOais0T3ZrbnZaMDEvSW1kSzJkeHlVWW9vTXJxc1ZoWnV0SkQ4UGFLZTE5?=
 =?utf-8?B?Y0NlK0N5Smp6eU4zWlJNWlpGRXRFVWxhNGd6VjYzSUZMRFlFbE9yb2w3c3Vy?=
 =?utf-8?B?SzJ5OUVSUXhBRkp4b2JuRGoxVVpTcjFPQXhqUGFXVk41UERMSXE4dCsvZTN0?=
 =?utf-8?B?UngvYnNjMXBCbzRtbTNKem4rV3EyUFlRWGVwd21tbVNSR2ZFQWs1Y3k2bSt2?=
 =?utf-8?B?bHdndFVRM0lPNTlUYjRtdVVubjNEQ1pvSXlyWmFMR2JwV0hldHVEK3dmRjFy?=
 =?utf-8?B?bXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EC5ED1722B4A3745ADAC9984A8FA2200@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b04d7709-75f5-41eb-839c-08de2107c922
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2025 09:50:45.6052
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a1I2TwYsU7MzaMeuG3cHtlxm+VTXlQMcl6/m6qdbz+8dlxQEp0TdP6LM6Kaf4ttrr3NiNsNLHkvDreU98rwLSlV0fVrVe219Sbl9MbhMyUa1/Jjykf3ypE+bxukp571A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6953

SGksDQoNCk9uIDExLzExLzI1IDI6NDAgcG0sIFByYWJoYWthciB3cm90ZToNCj4gK3N0YXRpYyBp
bnQgdnNjODV4eF9wcm9iZV9jb21tb24oc3RydWN0IHBoeV9kZXZpY2UgKnBoeWRldiwNCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgdnNjODV4eF9wcm9iZV9j
b25maWcgKmNmZywNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCB1MzIg
KmRlZmF1bHRfbGVkX21vZGUpDQo+ICt7DQo+ICsgICAgICAgc3RydWN0IHZzYzg1MzFfcHJpdmF0
ZSAqdnNjODUzMTsNCj4gKyAgICAgICBpbnQgcmV0Ow0KPiArDQo+ICsgICAgICAgdnNjODUzMSA9
IGRldm1fa3phbGxvYygmcGh5ZGV2LT5tZGlvLmRldiwgc2l6ZW9mKCp2c2M4NTMxKSwgR0ZQX0tF
Uk5FTCk7DQo+ICsgICAgICAgaWYgKCF2c2M4NTMxKQ0KPiArICAgICAgICAgICAgICAgcmV0dXJu
IC1FTk9NRU07DQo+ICsNCj4gKyAgICAgICBwaHlkZXYtPnByaXYgPSB2c2M4NTMxOw0KPiArDQo+
ICsgICAgICAgLyogQ2hlY2sgcmF0ZSBtYWdpYyBpZiBuZWVkZWQgKG9ubHkgZm9yIG5vbi1wYWNr
YWdlIFBIWXMpICovDQo+ICsgICAgICAgaWYgKGNmZy0+Y2hlY2tfcmF0ZV9tYWdpYykgew0KPiAr
ICAgICAgICAgICAgICAgcmV0ID0gdnNjODV4eF9lZGdlX3JhdGVfbWFnaWNfZ2V0KHBoeWRldik7
DQo+ICsgICAgICAgICAgICAgICBpZiAocmV0IDwgMCkNCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgcmV0dXJuIHJldDsNCj4gKw0KPiArICAgICAgICAgICAgICAgdnNjODUzMS0+cmF0ZV9tYWdp
YyA9IHJldDsNCj4gKyAgICAgICB9DQo+ICsNCj4gKyAgICAgICAvKiBTZXQgdXAgcGFja2FnZSBp
ZiBuZWVkZWQgKi8NCj4gKyAgICAgICBpZiAoY2ZnLT51c2VfcGFja2FnZSkgew0KPiArICAgICAg
ICAgICAgICAgdnNjODU4NF9nZXRfYmFzZV9hZGRyKHBoeWRldik7DQo+ICsgICAgICAgICAgICAg
ICBkZXZtX3BoeV9wYWNrYWdlX2pvaW4oJnBoeWRldi0+bWRpby5kZXYsIHBoeWRldiwNCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2c2M4NTMxLT5iYXNlX2FkZHIsIGNm
Zy0+c2hhcmVkX3NpemUpOw0KRG9uJ3QgeW91IG5lZWQgdG8gY2hlY2sgdGhlIHJldHVybiB2YWx1
ZSBoZXJlPw0KDQpCZXN0IHJlZ2FyZHMsDQpQYXJ0aGliYW4gVg0KPiArICAgICAgIH0NCj4gKw0K
PiArICAgICAgIC8qIENvbmZpZ3VyZSBMRUQgc2V0dGluZ3MgKi8NCj4gKyAgICAgICB2c2M4NTMx
LT5ubGVkcyA9IGNmZy0+bmxlZHM7DQo+ICsgICAgICAgdnNjODUzMS0+c3VwcF9sZWRfbW9kZXMg
PSBjZmctPnN1cHBfbGVkX21vZGVzOw0K

