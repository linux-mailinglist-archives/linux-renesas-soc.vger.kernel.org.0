Return-Path: <linux-renesas-soc+bounces-28428-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCTxELaunWmgQwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28428-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 14:59:18 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 518601881B3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 14:59:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CF601300863B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 13:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC02739E6C1;
	Tue, 24 Feb 2026 13:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="M3L1NYE6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011043.outbound.protection.outlook.com [40.107.74.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F399395DBF;
	Tue, 24 Feb 2026 13:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771940814; cv=fail; b=a98TqgBfdGK28r7IoJpqu/XQ3+bDNDeEoufMQyiEX8NSUC0KxN3eJhxb4QyZdmiB4iqWVmuI44mip6TWAl3lKyWHtjDUAJ0/3wED2idiWyZ+IUFj/49ITA40KDR3x89UK+fuVUG+x1gEMkvRybPuZP3c+4C+tylwLMWTm0Ap9Fg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771940814; c=relaxed/simple;
	bh=kRKwQ3r9MgFcd6bKtRLJuZMFir4eGlR0bZKxFriwDoU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pRoTGclYZAZwnuX4fTc8N/xcKmB47xjrzNftk6pTs6w+XqrY+xCPAjBR/4tGANraikukMlFIXAqt/mCr9cSc10UecU0bRyGG918PfpUrCY9bulcO+67Y05m/rtTV9dJk2stg3JAt9W4e1mqH/7+Mv3MJcIFpjAabA/0MfaEtbUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=M3L1NYE6; arc=fail smtp.client-ip=40.107.74.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mx7DEx87TtLldSWth70Fke01/sdvaDq8qIzvoRqMjS4li8MT0B5rBSRLZKRf4M2ylOOmraMYKaiIEw33n10712ZMBjqUS7ZfHp4Vx7YusVIv3D3REKczw4SvtrslZdOz7KAx0QCkgvVuia1nRuZ+hwQ8HY4w4AAeLOvZswi4kcjX/fQGd1x5oRbU95/eICg+EF8z+7WyL7DudtV/NnubOdhzBsOq96AVs1pF4ZYKYPVp8XZ+3oYLtzKA1W2NQ97bz8gGmsInkbGPlk1mkspFHNvoikme4zPrEcC/fhF2fnmY+wucnSbAzVGeGCGesnABcea3onBV54Pgl/5HsNC56g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRKwQ3r9MgFcd6bKtRLJuZMFir4eGlR0bZKxFriwDoU=;
 b=L5am5B36QBOdUTBHpYKhhYyZIW4u0x6STcjlLRngVhK5uaI2zeBflY/a9LAKZfGNC3fixNheZvMQnCCkPYOptzshAIZRsFhTyZctAzfDmba49wVSRqogFFOWywP7JFvdYpuiXXDILr/dQmEv1WdlxQL6WXZ4IWltRzTFTL2z31aXd3jX1BPKEx8oiFLth/MOKUnWXxw9NxCR/bXk32RRZ04lZUYSL/qRoxnd38MX2HzMqfF2tvcdrZCfNWrirfp1KuwwhuA6tb4OgQf4J75Y8pIU+qujPUxu+9x0BKAn8E413qDh9jQZXd4AHkyWZYmce1IV3LfyaVn4Vh8CcclyxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kRKwQ3r9MgFcd6bKtRLJuZMFir4eGlR0bZKxFriwDoU=;
 b=M3L1NYE6clY6HzivMzcJ0pqP8BvDcaHWd7GmavIsx0DcKmTpFod0QODHxeiAxTb/1Xc2GGiED0pKdvCutSPODj2bmX2FOjuUUJha7FHvG22wyxu014ze9DP3Sz+SUnRCJ6iEstdWhr7zxXQ/EsDJzqDj8wHdkG7yG3GxMX4gpbk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB14361.jpnprd01.prod.outlook.com (2603:1096:604:38b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 13:46:46 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 13:46:45 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>, biju.das.au <biju.das.au@gmail.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 3/9] irqchip/renesas-rzg2l: Make fwspec variable as
 pointer in struct rzg2l_irqc_priv
Thread-Topic: [PATCH v3 3/9] irqchip/renesas-rzg2l: Make fwspec variable as
 pointer in struct rzg2l_irqc_priv
Thread-Index: AQHcl1oiLfsl1evLHUagPguEIeNpn7V1jIMAgBxsXrA=
Date: Tue, 24 Feb 2026 13:46:45 +0000
Message-ID:
 <TY3PR01MB11346EA75A1C857208A2ECEF58674A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260206111658.231934-1-biju.das.jz@bp.renesas.com>
 <20260206111658.231934-4-biju.das.jz@bp.renesas.com> <87bji214l1.ffs@tglx>
In-Reply-To: <87bji214l1.ffs@tglx>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB14361:EE_
x-ms-office365-filtering-correlation-id: d1fdcb5e-442f-42f7-faff-08de73ab269b
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?n1dv4SebJVF77SHlEKIx1hGtAbzDtoQtTYlccgFjyWncnVLtXIH5flP7VA4C?=
 =?us-ascii?Q?mx8WyaUcj82HwHyfaTuZeC3lBV5JwAFGazUoGaVyq1f/MGl+cNCzO4FwPjlE?=
 =?us-ascii?Q?vRD8xVNgAD2kj02qbiYCRgEfHEFWMEI9X6h7FoJGMXh2SUUH87A0Vk9Fk2iC?=
 =?us-ascii?Q?MWoDOSbkVO9Vt1TxMc6z/7faCsEd+tDGuMLTeBwrs2SOAsDuCBObgZEkYvRZ?=
 =?us-ascii?Q?Po73X8FNTgfLisIKE2tsltNlmZJDBDAtye3EzlTL0Vvt8X1tq/SVZK7WmOrE?=
 =?us-ascii?Q?I9UnW8mjC455iJBkH24hG9DtHvAqlZp9yx+bub42GT8yJhBnAVQ3qLqfJYIY?=
 =?us-ascii?Q?rQp03X730lYzYMdH+gUx0lXv3/nWxhbRfps02luoxZ8ea5CinCrZ59XS9Gz8?=
 =?us-ascii?Q?IkZzV+PXjQpubT6Daz+yVxHIFRuTZ7px6KC2intrS16wWWx0SVwfz2BnCP6Q?=
 =?us-ascii?Q?HcaIQHMbNODM+0iL4822bZqhhKbTiF8GrCyhM1WwUhjow1z0FC0AlM+KsTqq?=
 =?us-ascii?Q?vSV9hc9GCjWRB23XZlHWjJ1dLc+lX6c6qF9UZuOi4nsPzQViOGHhi84d4lin?=
 =?us-ascii?Q?XUBCBZIfhTk6eJO+dzvEuI61Sj4Y/NLnjnMcoukqCYrPx4OMLdXw0DvI7n/k?=
 =?us-ascii?Q?3bBqtGcMOddhqDWNbkwbVu8114hRQ0ObyKprNOzw0Gg91E42Dj1BDJ2KDv2q?=
 =?us-ascii?Q?hJIxOHCziPCbdBHZGBUrEPGubmHOtBaHPOKnfKx/n3SBX5Vu/Wb0TAGdFWlB?=
 =?us-ascii?Q?dKny/pyZTMNtzWJ4XSHwBnReApo30LuJ8Cb+kWeHcj0z0DuDm1bnaXhtpY+f?=
 =?us-ascii?Q?afaXTOCvQixGObqAuOZzPdZ5TEKqALiB0nMrH+gQwJRYE9KuiyqC09Fw6lch?=
 =?us-ascii?Q?OkGlPmHTFA70+oPimRoD+LoEjTIylNcWxvzUwh1JuZorG5u38m4cPbCK2qmA?=
 =?us-ascii?Q?TjYZ8+569L98A+5srmh4yBwt8eyh8HIvn8cUbIUsHSsOOebvilmiv6fbU1DQ?=
 =?us-ascii?Q?7Dpqjtbl05QwRvf8UzJd94Nh6FIa396NaQ1bnE3v0nNf3WouY/zWjxn5+14S?=
 =?us-ascii?Q?Ean6INM+vmsBacwBJgUIaSjFwxk6ZZ1x8Ee0aiiuVhy4+2L4A/czNQWBQ0se?=
 =?us-ascii?Q?6MEGKtRlYLrCm7blOYyJxkgNtw0q2uAXenWkwxp1g39ZQ/EqPRYhU3YVcjs2?=
 =?us-ascii?Q?q4XZr/GT1EajUCPdyOtOjwxma2cZryamFqWiL/S4xV/YpCTUsORewpCYii9U?=
 =?us-ascii?Q?YH7Ekd5+fQcVaZDAC6wBnYUp8HnYd/yRx8vf4YhpjiOEyzaAWd5zS4HmAlBP?=
 =?us-ascii?Q?Mr5ufQKrfvCCuiCC/XxaKsCbmLFwdYVm9+weLKVTHJ8hkTP8FHpGDgA/UQtL?=
 =?us-ascii?Q?u+HzAssO3LBJsLrJX32woEPa0BbPA6i7yeME7/2YyDLUH19c9X8F3sY7G3AP?=
 =?us-ascii?Q?robUzxgnNIP3OjQfv10Wm6sOMTEySyS4dsya1EFs0Ae4WHjHTd1+VSEfdZIO?=
 =?us-ascii?Q?oZsFyzjQJzrvQQFM8KKrZPQApyY7OdqT8KOrfe3xREMnUuoUs2Jr4FqLjbDe?=
 =?us-ascii?Q?hjjAhxQboODWeap43UqN72e8YpBauxucs6cf8GTj6lG5HryXuWNfYt0NhZEu?=
 =?us-ascii?Q?ln3h7L5kk1X6Xqg4js5Pw7s=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?+cYLqhF2mFS7FLcCCzAnxv5N5OniPMMX7tWlDpsem9boZg0+Jjlr7sP7pU5V?=
 =?us-ascii?Q?sNLCk9TlzJC3aHLoltVecb2h0fjZYOBlvyEWLDIRjaoTEBSs8Tg3psdrDXhK?=
 =?us-ascii?Q?fPi+1BtCj5ZXv2vRao+SjXR6ArTscRGJ54iA1DTj89I2fGGbSC8h30FjnPoR?=
 =?us-ascii?Q?POel5DVLhK5ZwJ+2OKds0BnyZbiZM02oSC+Xcuqx8h/zsdOKnadsUY3hToty?=
 =?us-ascii?Q?YV5xyT71X63ZJsFrWUwT83n+jc0xXmjZGhDWZ0rtceAFrNh6d/7u3VtnQO2V?=
 =?us-ascii?Q?NgtumhRCVpMsUyWK6aooLNxjdbFbwOoKS73gS6tiKzlLWMjXckFySiQA6NTo?=
 =?us-ascii?Q?AhHx4M3As1j34BRB4GHwa8Ry8Tajsp5clR1aBnn3LVLP2EtVkDa+rF+U7bRo?=
 =?us-ascii?Q?ESlkAiZc91+6BNlSsoZx/XctQu/z7p7Emhd2rx0mq+jYLjRKG9Mp8vBvL2zi?=
 =?us-ascii?Q?vjqaYITyBQUpCZsRlsAW6mPgwdY7A8xOsdFk/nHwO84s1QJMPU8gNxYKPECr?=
 =?us-ascii?Q?c85k87PrE64q8SefzeIRw8g+ly6TPjDjySiHOa6ZJDPwgGnP2IgRMWwq3sOv?=
 =?us-ascii?Q?/OxuF8Ju5EndBF8zKaVBk1dm+CVPuEjIDVuBMWlkwzsd1MRmRgRTMFwKSFPA?=
 =?us-ascii?Q?yllUeb/WCOLPiLLbKdB/UIu4+/KjEcL6Xd7rFe8yEaHPR8Dkcjcch5TvFvXK?=
 =?us-ascii?Q?phQ43blvmT1nzMoYuh5J+XqjO3HBCHEdBy/ZybtvU0Zo3O6Bne8jOpoh0NwR?=
 =?us-ascii?Q?rhDuVQJl4DH7IDGSoOXI7lCLI3Ddk5+Ntx7EnSu1pTPrmRTRFzQFpb4J4e57?=
 =?us-ascii?Q?b8FTPzjOVGMLHmJX0Bpazeyhk6ivbNr5huz8wdVT0d+B/2yY0Rek/JwTWj6/?=
 =?us-ascii?Q?KJ39JiD0p0ZnFy9ggIHX4jxIFRELFhrDihr4c20CXhyfHkuFGJ/5WNULxCJQ?=
 =?us-ascii?Q?tOVpEh5oAOVn/WB/ge/kh5TjOu2njoRoNifHHV9mON66Iwx6g/SoP6gJPOTs?=
 =?us-ascii?Q?QzyWDzBMiYox+/J0tfKJvzYMeAWEcBsguLWGs3fQFK3pWrIKfVyqggTdr5rY?=
 =?us-ascii?Q?SC6TFrr+QSVTDglyMxq7I3XMaBEdH9nxJ8octAjw1je3waz0nqOUMU6HvKcd?=
 =?us-ascii?Q?cm7JqokHr72H/9lp7qrYjkprc483meXQriJ9yxdCiO2rGjOKsm8M5DfzX9kL?=
 =?us-ascii?Q?VgQi2bIGU3y7AWDMOP6mrRBOS8JPlruG87vqM3aLwILe4t/MFfLyWFHktqt1?=
 =?us-ascii?Q?AOsMcrxPgebEBJYLN/JYcQSqM3lWXRus4DhIpgjwR/zR4MsHIig03YRNFB/k?=
 =?us-ascii?Q?s4JnWrlhNWK9tmX26c5Yzepy5AQtTqxo+kDkJyQtniy/tUqUWPcbEOjKkyu2?=
 =?us-ascii?Q?8mzPq73dapQA1jqyn350tqhKFaARRNfouOUXBgJ//Dp9FaXzVwDpx3RgUP6S?=
 =?us-ascii?Q?5sOtASRY+ubHvG+wWcsHL9+t0Fp+nR4IRpz95TsTAYIIsQ62eLWrgoPpI1BW?=
 =?us-ascii?Q?kUVD/zZfNRiNz3aNNnumDQUvpGHNVgIiO88DeL2rkxXOZJBNi4kEdECh7BJJ?=
 =?us-ascii?Q?IHon4SVnffG25heivDG+Apx0VXWZiMFrv7WBEMkUzfmsLJjz+mbwjLAX0vvu?=
 =?us-ascii?Q?TfDYJEZDCl8OhGlGgVWwoKZ5Q940hxA+sRDTS/9CMiS5K50MgzIX7b3oseP6?=
 =?us-ascii?Q?XJPOUo0mVXo79wlV/078Zrzf90AxwfiVgUVFnFbUmdhJK/pFKr9uMk/hLWBt?=
 =?us-ascii?Q?XDlAUjafFw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1fdcb5e-442f-42f7-faff-08de73ab269b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2026 13:46:45.7124
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8pWgu2UrHFeijw9hLSCr5H4p7xOOTvL7SUAWbnfxgekBJwiO7HYZqMIOQyMF/V3I0Y+kM5VM3eaHXJDcd4KbZdSuX6nYIn23aOePpNzmhA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14361
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-28428-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,glider.be,bp.renesas.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 518601881B3
X-Rspamd-Action: no action

Hi Thomas,

Thanks for the feedback.

> -----Original Message-----
> From: Thomas Gleixner <tglx@kernel.org>
> Sent: 06 February 2026 11:42
> Subject: Re: [PATCH v3 3/9] irqchip/renesas-rzg2l: Make fwspec variable a=
s pointer in struct
> rzg2l_irqc_priv
>=20
> On Fri, Feb 06 2026 at 11:16, Biju wrote:
>=20
> $Subject: ....: Dynamically allocate fwspec array

Ok, will update.

>=20
> or such
>=20
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > The total number of IRQs in RZ/G2L and RZ/G3L SoC are different. The
>=20
> s/IRQs/interrupts/
>=20
> Use proper words and not acronyms. This is not twatter.

Agreed.
>=20
> > RZ/G3L has 16 external IRQs where as RZ/G2L has only 8 external IRQ.
> > Dynamicaly allocate fwspec memory instead of static allocation to suppo=
rt
>=20
> Dynamically

Will fix this in next version.

Cheers,
Biju


