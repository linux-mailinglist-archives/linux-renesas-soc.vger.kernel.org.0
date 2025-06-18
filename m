Return-Path: <linux-renesas-soc+bounces-18488-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2EFADE607
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Jun 2025 10:47:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7BF217CCD0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Jun 2025 08:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 966A323A9B3;
	Wed, 18 Jun 2025 08:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="u9gI5Yyp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011058.outbound.protection.outlook.com [52.101.125.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7F42F4A;
	Wed, 18 Jun 2025 08:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750236442; cv=fail; b=J3IecQ2OI9Rg7TFzvuW3bOWigBpcE7CL1ErqZnvcewXmsn/N/7p46dD/qrF4+UcyNbb7P2PPPa5swvYUmCfqtUOxYyoVjBbFm7Vd0s+FAeifsIF0MXe7QA9aSN2mbJGDMtcdoRkZJtiqWZqGkDcjK9G9ge52CVSO4E+oFRN+NmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750236442; c=relaxed/simple;
	bh=dKM2eLC/iiawbTUdqGT0HeZy+dDG1n3jYZuggKtypnc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FfTlIKejaHH2e3hm2iy2PeW+EXsBbH7npJI0mM9q7q7HfD6m3y+QpSwPpMs5PL2bf48NUTKUoKPthlU7XDfDyzTj+EVQ8C/QTCyUlnws7Cqw4SZkMfia5N5MhK8UwdsEzEtDVKjxyPmBc+xZQ1ls6WPCqYEniB1oSImqU2MfHmc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=u9gI5Yyp; arc=fail smtp.client-ip=52.101.125.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZxRHJkdRBEve+n9mo4f070qJ+fSgH6+JP28oQxeDxfPlWRw2WOZ9QvA2n2WsIIWaI8h0O5DUcCHUYAOJQ5RE45/D3RLd7+Ej5LePwQ4z7rJV06KNfu96J2r1SN9Mv1G1AqDiar1lC7siCviaAgFJAIH1MwkpsTd4SAYfUF2fE+6i3Njj/G4WK6CYxlV12iu7AMK4BsxQfIQ4mGyDhcN5J69dYwyGODwRvJ/bJdLTBF0SnU2WJHV1QyNHy2FIBVQJvWTT4KzyjZPA8ctCai4/q/r7tH92VMx8SAIdY9BMH+EvpaP5yUQdXDH4xwNbNdsJbID0aLchNPPOKL0+JAG2bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dKM2eLC/iiawbTUdqGT0HeZy+dDG1n3jYZuggKtypnc=;
 b=pK3kXKodZTT+WfVXLywH1nopH+tu+p5BjPHwRYOcD5O5ZSNw7C69+jWTcGq1q+ltuD+zD+dnz4jzkSQPOzwacRI7+99MccMaaI4l7/61iGGZtuFeWhwXXU1t7U1GqUWj/mm1aOliWFDw3LjeF2MzFN/i4jdt6mEUoV6k1NCmQ6thvbvEQcI25bP5pSL5/jOJ4LIZxOmyc63mJm9QN8U2GlOJtnHQeovWJaoxhlNNlLh/LGu+678WhGR8M7CEfgwQvuHC8IMdIQ/usXv9+y0Ku1XUwQoIBROoFpmKE/m4qeP6uV2dtH/ubP+y4Zbm3XQcIXj/5T52WoyBsEBfTI187A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKM2eLC/iiawbTUdqGT0HeZy+dDG1n3jYZuggKtypnc=;
 b=u9gI5Yyp71p9K4QSkhaDgmSuTQGZ9ZhCG+fCMhfw3dIprIB1ULTsHZOE8mg/OV/jWdzDLsEZbmrcxbP4E+/iTTqdy3WzbQ6xR1LtPPFjNeE86lB1aHGzvJkuRrnT/K/LtL4aQTSeUW7pQpkVCsGCEkGismx/aqTl7VCBmFd/08E=
Received: from OSCPR01MB14647.jpnprd01.prod.outlook.com (2603:1096:604:3a0::6)
 by TYVPR01MB10638.jpnprd01.prod.outlook.com (2603:1096:400:29b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Wed, 18 Jun
 2025 08:47:14 +0000
Received: from OSCPR01MB14647.jpnprd01.prod.outlook.com
 ([fe80::40e:e798:1aea:ca82]) by OSCPR01MB14647.jpnprd01.prod.outlook.com
 ([fe80::40e:e798:1aea:ca82%3]) with mapi id 15.20.8857.016; Wed, 18 Jun 2025
 08:47:09 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "robh@kernel.org"
	<robh@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"john.madieu@gmail.com" <john.madieu@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"magnus.damm@gmail.com" <magnus.damm@gmail.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>
Subject: RE: [PATCH v2 3/3] arm64: dts: renesas: rzg3e-smarc-som: Enable
 eth{0-1} (GBETH) interfaces
Thread-Topic: [PATCH v2 3/3] arm64: dts: renesas: rzg3e-smarc-som: Enable
 eth{0-1} (GBETH) interfaces
Thread-Index: AQHb2phinMa6OlUdnEShl/Fkx/3oO7QHigEAgAEammA=
Date: Wed, 18 Jun 2025 08:47:09 +0000
Message-ID:
 <OSCPR01MB1464769E5A427DFE8D7AEF867FF72A@OSCPR01MB14647.jpnprd01.prod.outlook.com>
References: <20250611061609.15527-1-john.madieu.xa@bp.renesas.com>
 <20250611061609.15527-4-john.madieu.xa@bp.renesas.com>
 <CAMuHMdWJNCSUj6mUweKtXycHNNok4L=TFQipVO8n9g7DiU=b9A@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWJNCSUj6mUweKtXycHNNok4L=TFQipVO8n9g7DiU=b9A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSCPR01MB14647:EE_|TYVPR01MB10638:EE_
x-ms-office365-filtering-correlation-id: 5c602ef0-9a50-4ffa-9ec9-08ddae44b5fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VHB2YTlQYlFOQmVUcHA3VU14bHpXODV2ajRya0pZS3VIMWdkUUsvNldLc3l2?=
 =?utf-8?B?YnUzSFhnKzNFaldJTVhTUTVEUVRRWEpEclkvbHNwYVVlRzh5ODd3aURJUWtE?=
 =?utf-8?B?TEdHRjdCc0l4dkJoTEZlTHFTSkFHUTVYSGVCZ3d0VmFJd1hxQTdCc2hvNktM?=
 =?utf-8?B?WnZ5WHVJM1VrTWZMSnNpa3dQNVFXR2U5N3RlczQzZHZHUmVuQWtGZFpaaDRW?=
 =?utf-8?B?STdRaFZ6RlVqc0dGaEgyUjdYaEt5YmRzbXc3dG5RU1kycWNyNTd1NWI3UHl2?=
 =?utf-8?B?Yk9CNHpDR1c0QzU5a0FxdllpeksxNnlSU3FweUZYYjNBMEZGdkkzbzlScHV5?=
 =?utf-8?B?K1RmNnVnbnY4aWVIc3NOcGE3cjlieFNFODVXaVo2VTBVcjFxOGdRcGdTRGdS?=
 =?utf-8?B?ZmQwd1lEaTRzVnpOekxBWDVuNU5iYU5DSnl5bzRzOVNHUTJ1czlpcWE0MkNL?=
 =?utf-8?B?S2ZRZkc0R3poSS92OUFMWS9sUk1ZYWoxNE1oSmFxU0NwUXprL0EveWZUcGVT?=
 =?utf-8?B?bzZZUEk2R0RCVGEwdXpsdEV1QlN1b0lVNmlKOTcxcGo5TmxIVVhSK3hMZ1Yz?=
 =?utf-8?B?MkRuNHFpM3kvZStvSmVNb2FXV3FJSURVb0lkaUFmaEdWRGw0TlVIbDBYano3?=
 =?utf-8?B?bmRzeFVLMWJqa3ZIVHhJbTNCVDcvalI0LzZkYTlXbGlodlhQMTg0Mytzd0Zx?=
 =?utf-8?B?dWNVZUpzUnRINkpHZysrdXBPK0lsSEwyWTFaQWVFUSt6Tlk2eXQ5SHhCV3RY?=
 =?utf-8?B?d2o3U0MyQUpneFFxc1prQzJjYmZhbkd4MCtuY3RxYS9SOUdWUlU3cVhGT3lI?=
 =?utf-8?B?V3ZpZmRwY2ZzWFMvVXUvdUNmalpyRi9KZG02MHVRK3NWVklUbWNVTHVHb3ZJ?=
 =?utf-8?B?aWVKOUtkclZBOU1Ma0o0ZElZVVdIUThuU29NTDF0Y3pLMEJiUUp4Z0FvK25Q?=
 =?utf-8?B?Q3VVOFB6WjB3YUNyTGdEeWhhVEFXQkIzVUdvdmRRQ3BRU0htY0RpOVMxK2li?=
 =?utf-8?B?Zmd1U3BWMXQvQWQ3ZjhlWEFvbWFTYUJwOVgwZGh2TktSN3AxZkZvcFVqZWVS?=
 =?utf-8?B?bXgvdVN4cmluSmR3encrZ0JJdjAvRER1a2xhSlRwSUtXd3QvZW1SSWgxYklE?=
 =?utf-8?B?V0h2NEg4VXNRNHdycDgyQy9BZ3lOVS9pMkQrL1NqN0FwYTBuTGpweVd2R2Iy?=
 =?utf-8?B?VUVPS3dubjVlUHpTd0JIUXcreW5wV3RPeW1RQnFOYTQyR2tOQ1V2eWJXUGE1?=
 =?utf-8?B?a3poVGtBeHNuY2hrZUNqTXRVcThsZWJxQ3BmbVpMS1RrNmNyQjM3UzRhUFdu?=
 =?utf-8?B?NzVsYm1hUWhNeWNqOGFDSmdpQm04bllpbUJJZ3p3enNkSEQ2SUhaWWdMZTQ1?=
 =?utf-8?B?MS96SkRGOXprVDZKUHhQTnd1YW1IVDJpR2JrcWd0Tm9TUmplV0N5YmpZQkg3?=
 =?utf-8?B?Q1N5UndBWk9VNFFzQjVSK0ZrcmpBU1kyZWxyc3l1RUV5cXdsL29sdlhTTHFn?=
 =?utf-8?B?THpNVWdPR1hhb21peWd2QVZzQ3hLS0xtOEdaallON0JtN2w0NkpGbzlSUFRE?=
 =?utf-8?B?NmdkRlJteFlxVXNHaUZzTUZLRkZSN2NPd2pPUHZrNk1nTW5aYnZ4UklnZGgw?=
 =?utf-8?B?RHNTVnNyT1U5Y0ZPbTRLWkxyTk9zWDFQNk0vN3AvUjVIOTh2OElnVFlZT3FO?=
 =?utf-8?B?QnZPVDRpdDloNTFlT25lWTlSVHRBTzZwNmtTMjUrWmNDclI4d2JmWENBUUg5?=
 =?utf-8?B?K1M3bTBodTJKU2I4VkhXRUEza25aL3BPSHFuZHprNEQ3U3RVTE50V1I0bVdr?=
 =?utf-8?B?VU9vY2ZjQjI4M3RvYU5hSGxaekNGQVBuQWdrZWtxWE5HSERSVThndlRPWTJx?=
 =?utf-8?B?M0p6Zzh3YWlNMWFBZXhWNjEyb1l4NjJrNUVXUGZWbklkQ0UzY3J1S0xNUEV5?=
 =?utf-8?B?NkJnSlpuZHl4RmZhYWdrbnMyajFvOTE5QlJLMHlYazlhYVgxWnhYNUU3ZEZS?=
 =?utf-8?B?RzB3TlU1ZEFRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSCPR01MB14647.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dGVzTHp6OUdYM3hTako0OXRXYkxrYyt3R05xLzNWNEEwV1VHTzZHUDNqMC91?=
 =?utf-8?B?YXdMRitkY2Q2WmFVV0t1WjdtTE5MazRadE5ZaHhxaXdnNHoxSDlPcXRJUVE4?=
 =?utf-8?B?bWoyUmVMSml6ZHErMUp1Rmo2RnUyOVV1Y1pFVzlRRmdadkZudVFDajR1aE5O?=
 =?utf-8?B?TGI5SFlGeFc2WHBsVjBOUHAwYnFmSFg5UUpOcExYQnlST3oyY3Ewb04rcXN0?=
 =?utf-8?B?bHM0R09yZytSVW8vT0dTZDZKSUNGQUd2ekVOZ2hlTENkYURtWHF6dXNKajIv?=
 =?utf-8?B?VFNsNUlUdlNYd1VTZDM5cEdibVFod3c3Vlg2NXpNdGtzY0lyMXA3QUlXNVY0?=
 =?utf-8?B?Y0N5SkpFNzUxTnFycmtxVS9TYmtTY2xwZFkrYkY0cklxc2JMQU5pZmh2VVdt?=
 =?utf-8?B?YnRManFVVnN2WjdSa3ZnNkZxVjlHdlAxV2JjeVozcEp3eXZZVy9qV2M3S0w4?=
 =?utf-8?B?QU1ZSDB0WkwyWTRsdHRNRVdrWEdGZTRhcVFlUXpqY05yTWl0TUZYU0srVTNT?=
 =?utf-8?B?RjlaNytTd2pLR29VWjErQmtUNDRYTHFvcXRPNjlHSHMzekoxb0lGRk9VTHMx?=
 =?utf-8?B?RWdieElzLzFmQU16U0RaQzRYZTk5Nm0yWVJwdDBOQzZIQkYwRG5xUVRFY3Zk?=
 =?utf-8?B?akhkSnFIakpOOHB1cHFubWNJM1QwYjhkTXdhdmI5K216MGJsd2F5S3RzbFpP?=
 =?utf-8?B?SGFDeWtUVEl0MFlib2VCNURtbEZaY3VWekZHb2lsemJrazQzVllVSDFaT3B6?=
 =?utf-8?B?UXBPWmlaeldMRTlpUXVsNVgvT3FuL1JqU1hPMkpVS0NVNkhEeVJBL3Fwdlda?=
 =?utf-8?B?T3ZsaHFTM2l1a284RG5OUmZFeUprVnhhcy9KZ3BRZDlHOXJXcVNIcnJVUWRi?=
 =?utf-8?B?dlhzRUo3WEtGRHRWb0pqeEFtTVhHR1dLWFh4NnpnelBYd0RhL1Q5M2NmUmE1?=
 =?utf-8?B?WVlGeCtUa0lKVml2UW9Vby9jUDg4RzZCNFMydHlkUzJheGpMMWZsSTZhZWZ5?=
 =?utf-8?B?Q28zS2F5T1dhNjRqL2hod3BCOGRBdEFVZlFCdVU2bEhCcHRyWDE3VGVnSXZZ?=
 =?utf-8?B?MzdzRVRJYmRIeU9rY2thQmh3bWhsYmVFbVB5QzhNK3hhZzJOdDZMTXVYSDNp?=
 =?utf-8?B?WDZ4RGN1Q3VzQVVCWlBQMXpCRmI0R2tDdnZFdzhQZi9PeDVCZjdoczBGL1lW?=
 =?utf-8?B?NnZNTGtKbnZhSXlvMzR2dVk5YlRPT1JrNmJzUDFpZThZOU1ld0VkZEZDV3Ft?=
 =?utf-8?B?Y3psVzZVQk1KZkFmV1hvaCtWeDZPcVhmY29GQ0FhVTNxeWw1QzhpMkszSHFC?=
 =?utf-8?B?WktTdk9rb2hVbW1EejdWZ2M4R1BHQ2JRWGJTaUhzcHpYVVlRa2R3MWMyWVZU?=
 =?utf-8?B?MDQ0NXo3U1JnamF3TzVNN0s0WHZhNmhxdUVUQU54dnBMeGdvOFh6ZE83Z2lH?=
 =?utf-8?B?VkJ0c1JzT0RxRVJOMWl0ckRad2w4M3gyUU5TMXd3eDZlMnQ0eFRJWHV0K1RR?=
 =?utf-8?B?bEpBcmF1c2VRMWVMR04rYXV3L0N0dVl3Y1IvRXdQWUdRdS9RL1pydktOUU9w?=
 =?utf-8?B?UytZRzFuSGJ5bVpGVE0yRDk0aTRJa0F4UDB0bWZnOU54TjZ0N2twNHRDSU1X?=
 =?utf-8?B?R2lZZHdiOGhLMXlMNVFKblFGaDR4SWtTZGRHTkZ6QStQL0NiWDFEKzVJV0tT?=
 =?utf-8?B?UWMvTzJJR0x4bHlvaEppd05qVmJwSnZvN3M1citIdTN0bUtxbFZsOGxUYXky?=
 =?utf-8?B?R1dPcWErZEZnR0hMNTFUWVByWjhIbnozY3JnUHZiaU05OWkrTTZlb3RidDhU?=
 =?utf-8?B?NlA3eWp3bkk1c251SkhjZXlpV3B4WjZDS21JclNPZ1E0alpOTFBSaC9yamxj?=
 =?utf-8?B?VjErN0V6dzdaKzZTTHRJVHl2bEdHWnJxem9MUnB2aDBMSVA4b3VhRXQ0UENP?=
 =?utf-8?B?eHBZeXVJUkk5WkZ3eVNNelpNTUFDRmFvL1Judjg1ODhxMGdLbGJPRjVzV2NK?=
 =?utf-8?B?Z1hIdGRYeEpSdlNPK2lUbDlxSEpQNWp1bmxBWG53c0QzS0hEWEhtbStseU5t?=
 =?utf-8?B?N3hlc2EvU2h3amVBcnZkdG1XaDlONm9aSWtRcDNNdEJXdXFueE51VFpaWDFH?=
 =?utf-8?B?YWVPdFhCbTZacG44S1VienQrVG4wT0JTUzZaMUdHemh0M3VmQlVjMmNJZ0pp?=
 =?utf-8?B?Y0E9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: OSCPR01MB14647.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c602ef0-9a50-4ffa-9ec9-08ddae44b5fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2025 08:47:09.0505
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aM9HuJ1yExZ0TV0/rIm0qy5Mrln159/C7BJLHQxJ61dpQ+tL/Qnw/TLh4w4FPAHTtUqg81sLHIbzwjT6FGx9wphberSTaAOrub+lENwpqo0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10638

SGVsbG8gR2VlcnQsDQoNClRoYW5rcyBmb3IgeW91ciByZXZpZXcuDQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1t
NjhrLm9yZz4NCj4gU2VudDogVHVlc2RheSwgSnVuZSAxNywgMjAyNSA1OjUxIFBNDQo+IFRvOiBK
b2huIE1hZGlldSA8am9obi5tYWRpZXUueGFAYnAucmVuZXNhcy5jb20+DQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjIgMy8zXSBhcm02NDogZHRzOiByZW5lc2FzOiByemczZS1zbWFyYy1zb206IEVu
YWJsZQ0KPiBldGh7MC0xfSAoR0JFVEgpIGludGVyZmFjZXMNCj4gDQo+IEhpIEpvaG4sDQo+IA0K
PiBPbiBXZWQsIDExIEp1biAyMDI1IGF0IDExOjAwLCBKb2huIE1hZGlldSA8am9obi5tYWRpZXUu
eGFAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+IEVuYWJsZSB0aGUgR2lnYWJpdCBFdGhl
cm5ldCBJbnRlcmZhY2VzIChHQkVUSCkgcG9wdWxhdGVkIG9uIHRoZSBSWi9HM0UNCj4gPiBTTUFS
QyBFVksNCj4gPg0KPiA+IFJldmlld2VkLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVu
ZXNhcy5jb20+DQo+ID4gVGVzdGVkLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNh
cy5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogSm9obiBNYWRpZXUgPGpvaG4ubWFkaWV1LnhhQGJw
LnJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gPiAtLS0g
YS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcnpnM2Utc21hcmMtc29tLmR0c2kNCj4gPiAr
KysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcnpnM2Utc21hcmMtc29tLmR0c2kNCj4g
DQo+ID4gQEAgLTc3LDYgKzc5LDc0IEBAICZhdWRpb19leHRhbF9jbGsgew0KPiA+ICAgICAgICAg
Y2xvY2stZnJlcXVlbmN5ID0gPDQ4MDAwMDAwPjsNCj4gPiAgfTsNCj4gPg0KPiA+ICsmZXRoMCB7
DQo+ID4gKyAgICAgICBwaHktaGFuZGxlID0gPCZwaHkwPjsNCj4gPiArICAgICAgIHBoeS1tb2Rl
ID0gInJnbWlpLWlkIjsNCj4gPiArDQo+ID4gKyAgICAgICBwaW5jdHJsLTAgPSA8JmV0aDBfcGlu
cz47DQo+ID4gKyAgICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOw0KPiA+ICsgICAgICAg
c3RhdHVzID0gIm9rYXkiOw0KPiA+ICsNCj4gPiArICAgICAgIG1kaW8gew0KPiANCj4gJm1kaW8w
IHsNCj4gDQo+ID4gKyAgICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiA+ICsg
ICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsNCj4gPiArICAgICAgICAgICAgICAgY29t
cGF0aWJsZSA9ICJzbnBzLGR3bWFjLW1kaW8iOw0KPiANCj4gTm8gbmVlZCBmb3IgdGhlc2UgdGhy
ZWUgcHJvcGVydGllcywgYXMgdGhleSBhcmUgYWxyZWFkeSBwcmVzZW50IGluIHRoZQ0KPiBTb0Mt
c3BlY2lmaWMgRFRTIHdpdGggdGhlIGV4YWN0IHNhbWUgdmFsdWVzLg0KPiANCj4gU2FtZSBmb3Ig
dGhlIHNlY29uZCBpbnRlcmZhY2UuDQoNCk5vdGVkLiBXaWxsIGhhbmRsZSB0aGF0IGluIHRoZSB2
My4NCg0KPiANCj4gVGhlIHJlc3QgTEdUTSwgc28gd2l0aCB0aGUgYWJvdmUgZml4ZWQ6DQo+IFJl
dmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0K
PiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBH
ZWVydA0KPiANCg0KUmVnYXJkcywNCg0KSm9obg0KDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZl
biAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtDQo+
IG02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2Fs
IHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4NCj4gQnV0IHdoZW4gSSdtIHRhbGtpbmcg
dG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nDQo+IGxp
a2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2
YWxkcw0K

