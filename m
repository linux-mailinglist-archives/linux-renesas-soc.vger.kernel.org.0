Return-Path: <linux-renesas-soc+bounces-28937-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCmbNELBqmlXWQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28937-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 12:57:54 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D778221FF76
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 12:57:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B2A46300D771
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2026 11:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86B10367F37;
	Fri,  6 Mar 2026 11:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="iMAeYD7x"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011059.outbound.protection.outlook.com [40.107.74.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD0A36D4FB;
	Fri,  6 Mar 2026 11:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772798267; cv=fail; b=YjZiXJ8/Dz61ZUXHmlko1s6JnCVVaKBjui2Tk+FOU4M+51qLLnjwx2nl/3LUf8Q8It6VNYT2nbW5pZjH7/kHnyFE7iXZQG1rMvs0ZNTQAiCOLxsrAoJZau4tdZjBv67WN0IYKsOM/2j/dJjap+oThh41ZIqnBPWcg+7E2374eSA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772798267; c=relaxed/simple;
	bh=hwL7tQuti/hFpHnUxDD26E9F5CnCzUo3hj6hl/VJX/c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tiRaSBpKwts1xBSosKxNvuTTq0m9fMhW0xBBmktda++0Jx83LFI7eNYTz3Sp78CNQSdMS2rvmUzCl4d13ScjlfAwBY+y51BTYhokXpNTKotk6JM8bDr40/ieT3mAa8ehf9QnZEywAVQ2kV9aTASH2rStK2V/DQJ+e1RGuEjYce0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=iMAeYD7x; arc=fail smtp.client-ip=40.107.74.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v1ifNlMp8VFU+ANZm/NLWKXOXIqf4jk1N7bkpNzylCDtlpulVqpC1rP+0Mb99M8E/cGLC3rIBVqtdPdtTu6WKX0dPj+nGqGNknCn/PJ5/Wga/bVlc0kH570+h9GZwdr8/Pe4L6iIFQSIbZOZ/vFh9tkWx4AhsQ/PgstOpAjGiCNhyCH//GiqAVgIhTnCnLq9To0PaBhJviJVpz1oMgP3szetSkc+hSqMVc6g020ogQEU1i9MC01BOuJ0C9js9Gn9TyVKQ+lghnNhwkWUWEouUS0bDL7LryreSnQO5cbOl0IQL+icXz5gJnQ5Yhokr41vIs9eiCFxu8ccLI1+Pmzwcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hwL7tQuti/hFpHnUxDD26E9F5CnCzUo3hj6hl/VJX/c=;
 b=gnYDf4CJnrpyyzfMGmYFuK0/76VU6+sqtPixZeQRg1yv3nsji8c2ZgIgkna5VmFXATe0e3R4EM9yO+31i531CHVkgyX+q30fdfA5uQSFaoAOX7WTqW1WohHAcu8SIUub+gg1ZFLDIvdI3gvmT0DiRHJ5DOw0yD1iNPaU6aM6ex2y6RaaNFtmiwae5jJi4vRjIgbEyeex0DP5HFZNZUD2gBBka34k2u/kdKCYVLuKPk1hcpzoxD6CnY2SxA736yMpViWuaBEf1aRzvJKsZw+JZeoketm6IYdCOAVJqjmo60ydkojehT2QhjVmyKXTgGIRavGQQ8SyFPb51QHUFfGi9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hwL7tQuti/hFpHnUxDD26E9F5CnCzUo3hj6hl/VJX/c=;
 b=iMAeYD7xgb9zAErKY7Ednlix7RYuUkLHRwmQ3sD7MjKyOgiiB+hx5Cx3NgsecOBVe7VxvJrJMf/aHtTPFzsndQa+6kaI7slvECNBWzT3C8hKKvlkvI17U/tYB32N/t3rUsNHdqQrZFYIRbN4V73rqW+bKS6i//fWmvaUTXNyf8k=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB7060.jpnprd01.prod.outlook.com (2603:1096:400:c1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 11:57:41 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 11:57:35 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>
CC: biju.das.au <biju.das.au@gmail.com>, magnus.damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 07/10] arm64: dts: renesas: Add initial DTSI for RZ/G3L
 SoC
Thread-Topic: [PATCH v3 07/10] arm64: dts: renesas: Add initial DTSI for
 RZ/G3L SoC
Thread-Index:
 AQHclPgnKnK+tkYa1Ua6JHvG2H9MT7WgNeCAgAAhRMCAAQuWgIAAASDwgAAIhoCAACnz8A==
Date: Fri, 6 Mar 2026 11:57:35 +0000
Message-ID:
 <TY3PR01MB11346A9D2D68182A800049D22867AA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260203103031.247435-1-biju.das.jz@bp.renesas.com>
 <20260203103031.247435-8-biju.das.jz@bp.renesas.com>
 <CAMuHMdW20h=D9Tk5T=6rxNanEiON1ZL35CJ6cqzrX12UeDcdPg@mail.gmail.com>
 <TY3PR01MB11346EEC0D9D7391EEE7ED27C867DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdV_WiB8graMNeJRVbNZczDetd+fA_4yxt5MV-h7Htzoeg@mail.gmail.com>
 <TY3PR01MB113468A1F5D5BA474644D2BFF867AA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdXr=8Y2cnyL-oOsCmzeNCqCYHm8dyDXWkhOd8qsshiOtA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXr=8Y2cnyL-oOsCmzeNCqCYHm8dyDXWkhOd8qsshiOtA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB7060:EE_
x-ms-office365-filtering-correlation-id: 746b0fb0-bfd0-4cb8-0ce2-08de7b778e88
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 XpuHO/7gS/rwmu/X8FnZL/9ywzYNFe0+74H5AhXBOPWcQNuTR8sWeAWWzcG9ujsNNQr+ljWfSaf0xJ7u/rJFQvvoFc8dDP7H6Y+oc9+WYi7dFIrWBocI/s3pXaCjSKlJ9JjHs3NQ6XPzmZ8ZmwKanbgPdl4wOcxLi9PyyPun4+y9e3BbimGWjBsVzNa5OpVvv3vaC4+2l9nGSYk/gIdKSym2bcBvxvryc8a9ntAfqifHWd+k8jtvpGAb2tF1H8Vjf+X5A+fhuGwnYN9cqz9F8ey0RaLEq+5zTCV2XZ6MUiE+U3ZvS0Uk7Dooz/RIOwsaQMVWMdNrDnAzl2RZ8bId2gLrpa15XnNhBHdVckorOO3IEuFnp4Nz+55EPT2yCEXiUlyOzk5iDgze6H2zmDGzxP8a6hogGVoVMtbTRGEuqsysREE6QMMgQLnH+Lfw/BRSDCPg2UYeK1f4urYjZgJD11LyJmTeBFndc0iBmDAfGRE3Jf/I0dW5RIPpET0YThQkhEE5tdzgYr4JwN7Pm+B34arMF/uYZsKgY/K8XCFGlYBBWRcfRArYPyPaLl39rvlaQw/NIEoAHO5zC/5YoIw3Kr3/vBd0V66mTf3WDhV0DBZhB59XSmluhq/wvoo7PCtb31sW3F8ZlqKPPgddUAK4dD2A2BI47UEuCSNnUOOQZWGywA55PfHn875v3FJVlQEUMHv7Q7JB2XBJXqGNmhj1JWcvY2V1ApMrGCd0F2mlBq45eQhDBiVvSDF4Y9fTyQ4Q0MoC1B4ItXY9FDiiE/owdTQhAXoTPgoPtgakG+F+IJM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VUlSbEY1RHlHQTZ2L2d4d1ZXSU1YQldDSDYwNVZScllvRk1lZzM3MjF4VDlq?=
 =?utf-8?B?ZC80eEVjTnlNaHdXZ01CWUFtVElsczZSZCtoRE9lTWZzOXdPd0QrVUliQWlp?=
 =?utf-8?B?dmUwZVJ6aWZoQUFlOGVUcHB5OEJsMnI3RTBETjVNK0I1ais1QUUzb000OVpn?=
 =?utf-8?B?NVBQRGUxVDFicktpT1dDREp2aUl5QU1kM0Y0aXJUdTlIK3o2YWx2YnliL0Ni?=
 =?utf-8?B?VUlsVVZObFdyUnc4UllZdjhhUWNDcDdCdmJwWFNHczZvVUpZVEEwaEVXaUNT?=
 =?utf-8?B?QTlZNVNUUCtVT014WTNiQnMwTUh6WHZENTR2OVQ5Qm5aNkp2QVd0V2hyUDZt?=
 =?utf-8?B?OUc1SlZ4VHVCN1FMcndxaFF5S3JhN1JINHdoem15ZjBzejFSUG9LYzJLNnZs?=
 =?utf-8?B?bVdPNndyaC90Mk9wdHRZdGNMVXowUTJ1dk85MUVubDF5eDZyMkYrWmpHV3RG?=
 =?utf-8?B?S1lOWC9PMXY0S3JYRWFKdDQxS1IzVWxXU2FpTkNjVGZaTEI3STl4bm9CdldL?=
 =?utf-8?B?OXY2b20yZzJJTk9LVGlIRzNWbnc5U0tFL0V4Q2twSDZGUFVYZDgwdTYvZnNt?=
 =?utf-8?B?Vm1JTCtOb0Jia0pFVnFYbmdEdEFTMjc3MHhBcE9jQ3Z5dEUwWlZZSWNRc21O?=
 =?utf-8?B?WkRaSm0rZ1R4ZFpiS0hISHFFZDFlNTB5ZWVtYytpZEZMOHJHVlk0TmxSbU9n?=
 =?utf-8?B?TDFoTlFWL2lYaWZWVEszcW9WTnd1OFVZWWZudFp5djM4My81M3FyYWh3WHJS?=
 =?utf-8?B?Z2k5dmtCcFNxQW5iOVZQU1B5MFBaR1dab3lkSlR3Q0tmSVJ0U1BWOFlvbFNs?=
 =?utf-8?B?VzR6emY4bXpoS2svQzF3ZVBEejZhbTAxQ1huU0FQWGlwc3ZNTVRjQ0Q3Qjhz?=
 =?utf-8?B?TW04aEpveUorY3lUNlQvSVdpcjNULzJlMDdIbmFhdUxWVVZWR05aSXpNTC9O?=
 =?utf-8?B?SWxwK3R4SkkzZGN5ek5SWk4zcmxPSHBNdlB2T3ppRTZBTXowbkpDNXU5YXdT?=
 =?utf-8?B?NFpGdGtDdjFPN2ZsUHhUdGV5QklJL29VUmVtNXVISHRuektreU1lbWk4QWRn?=
 =?utf-8?B?Rkk4RU5NbVBHMk5VamE2ZE5NWjJ4TUR1WWNyZjAvTkh1VHdUQjkyTWFzc3Q0?=
 =?utf-8?B?NXRPZFpHZEtuYnVhZkpUd3Zjb2hCUVhwNmlyclJ3bDJsKzdEd1ArbnNlS0dq?=
 =?utf-8?B?UzhnZVlyNEM2MHZhVVBpY2d5WGdVcXZpUjBCdFZOU3FCREE3N2c4MzB5Vzlz?=
 =?utf-8?B?M05hYVM3R3l1QlJobTlKelZRUkhiTnEzMm51Nk9CNXQwcXRlRktPaWgvV1Jm?=
 =?utf-8?B?Nm5raVM0NUQrL1dWOWhCWmIrd1pOcTFWKzd0eXdDMzZhMEttMkNweFdEM2gz?=
 =?utf-8?B?RlV3T0FTbVZOU2Z3UHdPVjc2OVBRblljdjAvcjc1SzJ4QlM2T3dlOW55MTU0?=
 =?utf-8?B?YUNjaHRHVEQ2RDNzbjNzNC81QnRuem15M2haZGs0YTR6NmR4Um14dkRwQmRX?=
 =?utf-8?B?TEwwSk5BVkF5Q0plTlRwMk5jUG1zQzdZWm9CZ0VjRE5yTEJaenB6WFkvWHZB?=
 =?utf-8?B?NGdqelB3K0tGaC90Wlo4VjhoK3ZWL244L0wzQlQ3QVprRWtUQkNCZGdEQ3Fv?=
 =?utf-8?B?T2tLbTROWUI0cmVraTNzbHB2aENRbzRtWm9QL1NrZnZkOHV1bjhqbFQrdFNT?=
 =?utf-8?B?d0xaaFR1SVpUa3o0dTBIeGl2VVY4QUdBWTdFQXBhTzUxVWUwZ3d3TmQvbUc2?=
 =?utf-8?B?YUl5emxXMlFiVVpvL1pndFBmMERwcXk1TW9ndjhSZk00YzhSc1dTbENETGhI?=
 =?utf-8?B?bExHbVZXdEV2UXVIaUpXRVZXc2s4bzd6WWY3MjQ4d3dCUGxPS0dnUC92cEl2?=
 =?utf-8?B?bXd6ZHF2NVNFVVFBZkxMSmFXRzJoeDR3VHdNT2ZTQld2bXduOHV4WW8xVVBO?=
 =?utf-8?B?WHQ5WTJ3SUlpR3NEZGtkaFJMS3RsdFNjdlROTm5ocVF0eEt3bFdnYXg2Y2VJ?=
 =?utf-8?B?TitMUmZUeC9VNnRYWDU1blFZQ1ZRN3dmVjZtMzBYbWh3QWZJTUtVQnVOM1J0?=
 =?utf-8?B?dHUycmc0S2Zqb2FGUUl6WWtnOXFTdXN3bFNQeVdNRVd5bVNkUGdYVUUwWG9X?=
 =?utf-8?B?ejFvU1VqcnNKVVI3VVRMamNkclF6cFE3NlR1NTJMSWlnNEFjVmVwVG8zelJa?=
 =?utf-8?B?cXJ2VVM0NDIzaEhFbUh1WURKTmtVN2Y4WlBKbTVVWGgxWlN5NExvTmhabURY?=
 =?utf-8?B?b1dGcDRETzZBbnY1VGFUemlrcmFUc1pLc1Urbi94YU4yVVN2QVdXdlkydmJa?=
 =?utf-8?B?QVpDaXZLYjZERk5veitneUpZdnBmN25lUE5IanJyWjQ4RzBqOTFyZz09?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 746b0fb0-bfd0-4cb8-0ce2-08de7b778e88
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2026 11:57:35.5309
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7m+KIbfCGx5f7ojn5Yf578gmL9L8ChWe2Nnrn0sDkbILEJKQq5SnfxORFzl3+vbUOaHG8tSEmDoh5NvOigNQ5lDSDDOFm6uqNkwa7W+YY/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7060
X-Rspamd-Queue-Id: D778221FF76
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-28937-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMDYgTWFyY2ggMjAy
NiAwOToyNQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDA3LzEwXSBhcm02NDogZHRzOiByZW5l
c2FzOiBBZGQgaW5pdGlhbCBEVFNJIGZvciBSWi9HM0wgU29DDQo+IA0KPiBIaSBCaWp1LA0KPiAN
Cj4gT24gRnJpLCA2IE1hciAyMDI2IGF0IDEwOjEwLCBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAu
cmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVy
dEBsaW51eC1tNjhrLm9yZz4gT24gVGh1LCA1IE1hciAyMDI2DQo+ID4gPiBhdCAxNzo1OCwgQmlq
dSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+ID4gPiBGcm9t
OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPiBPbiBUdWUsIDMgRmVi
DQo+ID4gPiA+ID4gMjAyNiBhdCAxMTozMCwgQmlqdSA8YmlqdS5kYXMuYXVAZ21haWwuY29tPiB3
cm90ZToNCj4gPiA+ID4gPiA+IEFkZCB0aGUgaW5pdGlhbCBEVFNJIGZvciB0aGUgUlovRzNMIFNv
Qy4NCj4gPiA+ID4gPiA+IFRoZSBmaWxlcyBpbiB0aGlzIGNvbW1pdCBoYXZlIHRoZSBmb2xsb3dp
bmcgbWVhbmluZzoNCj4gPiA+ID4gPiA+ICAgLSByOWEwOGcwNDYuZHRzaTogICAgUlovRzNMIGZh
bWlseSBTb0MgY29tbW9uIHBhcnRzDQo+ID4gPiA+ID4gPiAgIC0gcjlhMDhnMDQ2bDQ4LmR0c2k6
IFJaL0czTCBSMEEwOEcwNDZMezQ2LDQ4fSBTb0Mgc3BlY2lmaWMNCj4gPiA+ID4gPiA+IHBhcnRz
DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gQWRkZWQgcGxhY2UgaG9sZGVycyB0byByZXVzZSB0
aGUgY29kZSBmb3IgUmVuZXNhcyBTTUFSQyBJSQ0KPiA+ID4gPiA+ID4gY2FycmllciBib2FyZC4N
Cj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5k
YXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gPg0KPiA+ID4gPiA+ID4gLS0tIC9kZXYvbnVsbA0K
PiA+ID4gPiA+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA4ZzA0Ni5k
dHNpDQo+ID4gPiA9DQo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgZG1hYzogZG1hLWNvbnRy
b2xsZXJAMTE4MjAwMDAgew0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gVW51c2VkLiBTdXJlbHkgeW91
IGNhbiB3aXJlIHVwIHNjaWYwPw0KPiA+ID4gPg0KPiA+ID4gPiBZZXMsIGJ1dCBJIGRvbid0IGdl
dCBsb2dpbiBwcm9tcHQsIGFzIFNDSUYwIGludGVycnVwdHMgaGF2ZQ0KPiA+ID4gPiBkZXBlbmRl
bmN5IG9uIERNQSByZXNldC9jbG9ja3MgdG8gcm91dGUgdGhlIGludGVycnVwdHMgdG8gQ1BVLg0K
PiA+ID4NCj4gPiA+IEFoYSA7LSkNCj4gPiA+DQo+ID4gPiBTbyB5b3UgbmVlZCB0byBlbmFibGUg
dGhlIERNQSBjbG9jayBhbmQgZGVhc3NlcnQgdGhlIERNQSByZXNldCBpbg0KPiA+ID4gdGhlIGNs
b2NrL3Jlc2V0IGRyaXZlciwgYW5kIG1hcmsgdGhlbSBjcml0aWNhbC4NCj4gPg0KPiA+IEZvciBD
TEssIGFscmVhZHkgZnJhbWV3b3JrIGlzIHByb3ZpZGluZyBjcml0aWNhbCBjbG9jayBzdXBwb3J0
LCB3aGljaCB0dXJucyBvbiB0aGUgY2xrIGF0IHRoZSBzdGFydC4NCj4gPiBCdXQgZm9yIHJlc2V0
IHRoZXJlIGlzIG5vIHN1cHBvcnQgZm9yIGNyaXRpY2FsIHJlc2V0IGluIHRoZSByZXNldCBmcmFt
ZXdvcmsuDQo+ID4NCj4gPiB5b3UgbWVhbiBoYW5kbGUgdGhpcyBpbiBTb0Mgc3BlY2lmaWMgZHJp
dmVyIGZvciBETUEgZGVhc3NlcnQgbGlrZVsxXQ0KPiA+IERFRl9SU1RfSU5JVF9ERUFTU0VSVEVE
IGR1cmluZyBib290Pz8NCj4gPg0KPiA+IE9yDQo+ID4NCj4gPiBDcmVhdGUgYSBjcml0aWNhbCBy
ZXNldCB0YWJsZSBpbiB0aGUgU29DIHNwZWNpZmljIGRyaXZlciBsaWtlIGNsayBhbmQNCj4gPiBl
eHBsaWNpdGx5IGRlYXNzZXJ0IHRoZSByZXNldHMgaW4gQ1BHIGNvcmUgZHJpdmVyIGR1cmluZyBw
cm9iZT8/DQo+IA0KPiBUaGUgbGF0dGVyIHNvdW5kcyBzaW1wbGVyIHRvIG1lLi4uDQoNCk9LLg0K
DQo+IA0KPiBZb3UgYWxzbyBoYXZlIHRvIGF2b2lkIHRoZSBETUFDIGlzIHJlc2V0IGlzIGV2ZXIg
YmVpbmcgYXNzZXJ0ZWQgYWdhaW4uDQoNCkFncmVlZC4NCg0KDQo+IA0KPiA+IE5vdGU6DQo+ID4g
Rm9yIFN1c3BlbmQgdG8gUkFNLCBtYXJraW5nIGNyaXRpY2FsIGNsb2NrL2NyaXRpY2FsIHJlc2V0
IHdvbid0IHNvbHZlDQo+ID4gdGhlIGlzc3VlIGFzIHdlIG5lZWQgdG8gZXhwbGljaXRseSB0dXJu
IG9uIERNQSBDTEsvZGVzc2VydCByZXNldCBmb3Igcm91dGluZyBTQ0lGMCBpcnEgdG8gQ1BVLg0K
PiANCj4gU28geW91IG5lZWQgdG8gYWRkIHN1c3BlbmRyZXN1bWUgc3VwcG9ydCB0byB0aGUgY2xv
Y2sgZHJpdmVyLCB0byBlbmFibGUgdGhlIGNsb2NrIGFuZCBkZWFzc2VydCB0aGUNCj4gcmVzZXQg
ZHVyaW5nIHJlc3VtZT8NCg0KV2lsbCBzZW5kIHBhdGNoZXMgZm9yIHN1cHBvcnRpbmcgY3JpdGlj
YWwgcmVzZXQgYW5kIGVuYWJsaW5nIGNyaXRpY2FsIGNsa3MgZm9yIFJaL0cyTA0KRmFtaWx5Lg0K
DQpDaGVlcnMsDQpCaWp1DQo=

