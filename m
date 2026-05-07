Return-Path: <linux-renesas-soc+bounces-32251-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2POMFfiQ/Gn3RQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32251-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 15:17:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E90A74E917F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 15:17:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5E09730010CA
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 13:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A2F23F23CF;
	Thu,  7 May 2026 13:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="dj4OOlJl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010040.outbound.protection.outlook.com [52.101.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DE83EE1E2;
	Thu,  7 May 2026 13:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159861; cv=fail; b=J4ELIbsm0c24Nxg4IOOyReFKCHUd+pO1638pQTNdqD4DG9SFQznVZj8u74HUdLFW5/yo+ltmTnWrH2KN8ZvQoE9L3TJdcApYbke2+Njf6zGi4lnuy8w4P7GK4hzOBXEU1h/SCMR6ZZZ7mvkbOOESGCYz4c26OGhdb3CTXuGN34M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159861; c=relaxed/simple;
	bh=+Qcsxz9f3FekDWT62wBZWXd+w4yMAy0AOuDocoGTMHg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uHlFQNoz97Oj013P+jkmWnd/BjhCPiTJLngPvpa6izYPqMFkwYPm+b6p8SP3uv1PVyUR1BIsLYYThnuO7hW4OHubvx0E3AGosk76GigkuYNxA/XLTWBH62VxGP3bW6zEkfVOTbb59BOgQyrNsiuLu7KiXNfMCH5WkbxrFMQXGXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=dj4OOlJl; arc=fail smtp.client-ip=52.101.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vFBd8RaDLJIewizoFLxe3653zuAKIH26KT6uHSu+Tpt7oABhs8YDYvq6XWwh7cIHjfIeHiz672l6j43EaecDhMBnn3dcHJPDeHW1rJuCqbr8RCp374RQRRkC4AlirlX1cOFEDcmZKf3vLSFkHEm2cOOjcONnGYJ2ad/P31oICqmDwdGInIV2Ie7capF6rzx72F+/0gOcsndGtLveoBk77zo/0Lwvst7TKrYbKb9+VF6K3yvFyuYgGh3rhpF2Vb+2hzT4x9T0v0b/o4HSLxWOzvoSvsnDIXGBfLUBIpQq9e3/RAVSZC4V5UGSCUekCE0xjCRvR9nLwlR0XBmDMKMnLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Qcsxz9f3FekDWT62wBZWXd+w4yMAy0AOuDocoGTMHg=;
 b=EQMYRr9MTz86lZxxr/aYvIPPmTaiLs6c1rgnMoQNaqPfHfU84xBCSm0TjlSvA2DPdDhfpJv86FDbzyVv6imxKNFzn/X8diBklPPPXShB1DA5Tk79ThWeWwb4QSN5G3sZaeXpmpzlCrlERsr+9eZSfGMnEq6oQuuvdULjlXq9g4gSITOLd7EfDPm6yZDLBEmPSMVhBupNtenHJNXhH1pdAOjSEFOrF0GY7t2UNffv3bVcpf1Ui9B4qiQJoFlb9nuhpYwHdiZg9HzaAUEAHPeQR2CPWxmkG7QhccIFjhIM2u62ZYMsYSvjyh6DWeEnWO0462sGFxvOqQlwWWrOrUr4Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Qcsxz9f3FekDWT62wBZWXd+w4yMAy0AOuDocoGTMHg=;
 b=dj4OOlJl9ZojL4LAEoGejWGZwzGrHWVzld7OBTP5Uyvat5sTbUt9hEDtYaHXc1JBipDjUrNK+13wlzcYAl77u1Mq8aobusN3GyRY5FH7jTiT/LOjAMKD+L/jRcBieQHw35H6DisFq56KqqdbuUOjFVfJ1sGKmGAItqSxMyVBP+k=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB8144.jpnprd01.prod.outlook.com (2603:1096:400:105::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.18; Thu, 7 May
 2026 13:17:36 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 13:17:35 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 2/3] clk: renesas: rzg3s/rzg3l: Simplify PLL configuration
 macro
Thread-Topic: [PATCH 2/3] clk: renesas: rzg3s/rzg3l: Simplify PLL
 configuration macro
Thread-Index: AQHc29SpoFSGQdBkuUGW2rPNG38pybYCjOkAgAAB/cA=
Date: Thu, 7 May 2026 13:17:35 +0000
Message-ID:
 <TY3PR01MB1134628F2DAD819CD51F895F3863C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260504144523.153906-1-biju.das.jz@bp.renesas.com>
 <20260504144523.153906-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdWESdLpNzMzCvQ0ZJM_hg9fgw1T+pn0MoeXx74YyXc7-w@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWESdLpNzMzCvQ0ZJM_hg9fgw1T+pn0MoeXx74YyXc7-w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB8144:EE_
x-ms-office365-filtering-correlation-id: f1a2a52c-036f-4935-4c43-08deac3b0150
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|56012099003|22082099003|18002099003|3023799003;
x-microsoft-antispam-message-info:
 n/p1R3TAoq3f2gl6Xb16mqt0FktzcxrVUuuPBxXx+vEtSimC+KQMgDZj2NPGVtOSmxToLv5/T02W38Ybte38tTKcIyGkodzc9sszK/sJBFS3AWD0s5GVMK8GkF4ItdsIkGPvb1A0jv6mHDCogOxaTMOD6AawRud++94aYOP5ABbG4d9GxcXO1i4XwQsBZ9AxszSPLhOaQw+KFpJCZH63G89njKj4Gxn1uPaLZiNHKFyRCtA6QrS6/MckJOcmeen1nj2jBHWxr/l3kGwqghjfiRBnaXpuWmLt5C3YSVFalTuXks6rtm2BCYgiPrmqAvJH0Q9n8CGUODGKwmsIzm/5DJFsGTdNJukSJcV8McHJbxPHlz7wXiKLqbnQIgHKFLce+VNJhqnwYvedGCV5uFjgSL82KVMPLnfjQfThluhIZOdcRpisaCkGjC9YmJ2uABVYNOyxmWVfNnQgthW+ZohyBqzEVQPpllMPYgyDoySVNkBGd40DoziWF8B6eCmwNB2Ob71MeujNKPvWuXx8eCoUE1QDVaZUzE643Gc0PZCiuYHDoAXzimimg9snfz4jQBzhW/U6AASxB8vL1Wy1jhmcRlG7KUUFkrtJIpxSEm8rwBFVLXlrvwXUYFvhy/HUOlrvf2vaTSVTOBXWZbUxYLZ4v/VnSVAs0m6Hf8gSwiFPx6GsIp/P9BPSndpkzLm77ju5wPCerxsitOcZvfva+O01Et8z/Qma8kGz0+8ITEPpy9+hIx9IYWTvSiS6rheU3Dhq
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(22082099003)(18002099003)(3023799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UGs2Q0VTaTA5c2d5bjZNZ0gyWi9ZaXRSOWFleFBuWExXZnVRcDNCUFlHVlZz?=
 =?utf-8?B?NnpjNUlkcC9PSVd4OHh1Vy90Y1dHbGh3QkRZL0xTdmJORnBBbjcwaUU4bGgr?=
 =?utf-8?B?TFBJcVF2M2dsT2J4eTZjVmhjc0ZSL3VPdU1sV0Q0ZkR2cTNMbVF6ZWo2VGZK?=
 =?utf-8?B?K3JDQTgyRDhwYjA2UHVvNDBQR3BiZzB1bDFEZ3hmTWI1Ulo4RFI5ZGFobStu?=
 =?utf-8?B?c0h2WVFlMThvMGpGWHk5dTc1OTRMTnlab0NjR2E1c1E0Qml2OWpZdU9mcHFk?=
 =?utf-8?B?QmRhQ3R5aHFOZFlpbnFKWDdkcnpOdTZldHUzWnNmTitQeThNVUtDQ1UrRlRw?=
 =?utf-8?B?OVI4Q2R6VDNnTlYrNXpTSFpGS3gwWWNKV2tNOTg1aEZSbzNPcG1UeWIrb2dw?=
 =?utf-8?B?V3hSYWlJT0p1SXlpL1U4RzFBL3ZPVU03c2RGVXpZVkxTdk9XOGdDL3BleXJK?=
 =?utf-8?B?c1ZLb0pRSElOWnNZb01MRmVkMjRCT0FRNUZZcEUvWWdwcnhzTGlYN0pMb0JR?=
 =?utf-8?B?RDl0MzhlSWorRDV3UFJvQmFaRjVaSGJlNVRscEU3clJQUmRWa2JZbi9BOFd3?=
 =?utf-8?B?dnhybmpnSFV2Zkt1WlZKaTV0Y2RYNER1TmdMSURzUlM0UzQzdHhDN0p1elFt?=
 =?utf-8?B?bEdBT21Kc1h5NHFNWEdLUDVubXlXUkllYUxQLzhyaTJhMk5HakZPY09HVHo0?=
 =?utf-8?B?Qi9xZkl5WkNZOFFaRVNBNXR6eGlpNHY3TUQ3U3NVWTBxcFhJOGd0U3ZkOXd2?=
 =?utf-8?B?U2g2Y2pzd1ZVNGhJd0VDWFhIajNBbko0REY5QjBkeWVFekZ6RDE0QWFIWk93?=
 =?utf-8?B?cG9wYm9MbGNTWUJGSU9OV25IbEtNZjZOYUJRRVFTRlJDYzU3SGtieEloTjdw?=
 =?utf-8?B?d2FPZDlxZVdFL1g1aXFZRXVmQSt1NkZzY29URTM0bmZEYVhNOGJpNUFnVGJm?=
 =?utf-8?B?b1U3MlJTUGRUZjFZWjc5ajU0L3RNckZocWIvZlRDT3Z6K0plMmM2UnlMNzFQ?=
 =?utf-8?B?VFplQWJuaVJnbU9ac0hHaWpHemovVTZYTC9KTFJyL29vUDkzSUJFUXBDdnJ2?=
 =?utf-8?B?OWtmOFA1UkdsVWJwUHQ0MHFXU3ZFbEt4NzM2eUJEWlh2Ump4Qm1YOGd6cnhS?=
 =?utf-8?B?MnYxMC9ibGhXQW92M2RDN2V6WlllSURtbjZWb3JkUEU3NVE3S0paemFqNnVw?=
 =?utf-8?B?b3R2SG9lQ3NGTDhRRDEyais3Mzh1RHZmK1VYblZ1SVR4akE3a1dJQk4zbG5h?=
 =?utf-8?B?Mm83RWZNN2QzRitmSk40all0MThaRnV6b2VYNGdpVDVTekszWHpNSHJnWFZP?=
 =?utf-8?B?RUpBYmxqaDI3RkVZd3luY2tGdnZFWmVkMG1iUENjbmJIaEUvWTVpU1ArNkpo?=
 =?utf-8?B?dXZucTRqUHdma1htSlVFUnVlVlhQQmRub1RTYjRiMXdnZG1SNzZtZlBiT0Ji?=
 =?utf-8?B?QTF5bTNPMUhzbXhCSm05QVFmc05jdmtOR3JXUGxaQU4zL0w2ZnlDSkVpMHZY?=
 =?utf-8?B?dFlQLzlVTGVEUllBSUk4TWo4UFN4b2VPTVloUm5tQjlwU3pITFJYckhPcnJX?=
 =?utf-8?B?a09yajBCc3dEZ0VKZWF2Wkx2cEZ5RUkrUCt1NCtzM2VwUkVVVmhuVnVUaWlG?=
 =?utf-8?B?OG53WkYzQS82R3ZGVnRBUXZRdHo1bDlNOExLNjI0M1VGc1BMY2l6WHNhK0dZ?=
 =?utf-8?B?VStIQmRJUlFGUUwzSmRGK0lzYmtndTVrUHB1bjFxbFlFanRtd2EvVEtqOEFV?=
 =?utf-8?B?cG9tSXVBOVRjY3ZaZkRFT2x6RVFvR21zaVk5ZDJOU2JyS1Era2oyQWdINEk1?=
 =?utf-8?B?V3pJVkVBcTdBT295R3h3NXUrTGRENzNHUmMwZ2ltU1c3cEJyZkwwS2ZJR2Zm?=
 =?utf-8?B?Z1lTdzEwMUl2bVdsbjdsblVyRzArc0Q2SEkyd2plcFk3WU1ycUJSVDFiMUdG?=
 =?utf-8?B?a21HakxhRUl2UG96VnBHUGdCUzJ3R0pHOVY0aTRESVFkS25NYjRUTkljRkFN?=
 =?utf-8?B?a2V1a3hJODg2dWtBa3BUZ0R5RnFnaUJIRjkremhOS3I1Q0FUOEpsejFPK2VP?=
 =?utf-8?B?ZGkrRFpZY3B2Z3JEZDF2NlNiSkI5ZjhuRFhrbnpKRisvcFBtalp4bnkxZU5O?=
 =?utf-8?B?eG12b01EaG9Oa1ViM2FaZWI0N1FYc3pTSE5YNDg3amRaem1vK1NUeElHcmNT?=
 =?utf-8?B?cGZ4WnFpNVFkL2RyRXlmQ2ZPbWNJUDlRYXA3dkhmYmZLUXNjRFQ1V3Baa1p1?=
 =?utf-8?B?dENaODVjNlNZbEtEajBobHR0UEtpcWFQM2U3YnNSMjg0VjZEU3FQL3dCNGFo?=
 =?utf-8?B?ZW1XNEJSMnJMcEtjL2xaSUdEYU80QWRXc1ovVWdCZXJCa1h6SmUvQT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f1a2a52c-036f-4935-4c43-08deac3b0150
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2026 13:17:35.7659
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7EhOKBFB4pIKehkdIxuM70waqCpY4j0PPD1Mz5JoPuiRe9SVsqIHX5jlwtwMdK21t0klR264L/Yc1g0S2d0FUteCmd3bb+URZBxU4YKrfOg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8144
X-Rspamd-Queue-Id: E90A74E917F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-32251-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,linux-m68k.org:email,bp.renesas.com:dkim]
X-Rspamd-Action: no action

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrDQoNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhr
Lm9yZz4NCj4gU2VudDogMDcgTWF5IDIwMjYgMTQ6MDYNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAy
LzNdIGNsazogcmVuZXNhczogcnpnM3MvcnpnM2w6IFNpbXBsaWZ5IFBMTCBjb25maWd1cmF0aW9u
IG1hY3JvDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gTW9uLCA0IE1heSAyMDI2IGF0IDE2OjQ1
LCBCaWp1IDxiaWp1LmRhcy5hdUBnbWFpbC5jb20+IHdyb3RlOg0KPiA+IEZyb206IEJpanUgRGFz
IDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+IFJlcGxhY2UgdGhlIHBlci1T
b0MgRzNTX1BMTDE0Nl9DT05GKCkgYW5kIEczTF9QTEwxNDY3X0NPTkYoKSBtYWNyb3MNCj4gPiB3
aXRoIGEgdW5pZmllZCBDUEdfUExMX0NPTkYoc3RieSwgc2V0dGluZykgbWFjcm8gZGVmaW5lZCBp
biByemcybC1jcGcuaC4NCj4gPg0KPiA+IERyb3AgdGhlIG5vdy1yZWR1bmRhbnQgR0VUX1JFR19T
QU1QTExfQ0xLMSgpIGFuZA0KPiA+IEdFVF9SRUdfU0FNUExMX1NFVFRJTkcoKSBtYWNyb3MsIHJl
cGxhY2luZyB0aGUgbGF0dGVyIHdpdGgNCj4gPiBDUEdfUExMMV9TRVRUSU5HX09GRlNFVCgpIHVz
aW5nDQo+ID4gRklFTERfR0VUKCkgdG8gZXh0cmFjdCB0aGUgb2Zmc2V0IHZhbHVlLiBVcGRhdGUg
UlpHM0xfUExMX01PTl9PRkZTRVQoKQ0KPiA+IHRvIHVzZSBDUEdfUExMX1NUQllfT0ZGU0VUKCkg
KyAweGMgZGlyZWN0bHkuDQo+ID4NCj4gPiBObyBmdW5jdGlvbmFsIGNoYW5nZXMuDQo+ID4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+
IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+IC0tLSBhL2RyaXZlcnMvY2xrL3Jl
bmVzYXMvcjlhMDhnMDQ2LWNwZy5jDQo+ID4gKysrIGIvZHJpdmVycy9jbGsvcmVuZXNhcy9yOWEw
OGcwNDYtY3BnLmMNCj4gPiBAQCAtNTYsOSArNTYsNiBAQA0KPiA+ICAjZGVmaW5lIEczTF9TRUxf
RVRIMV9DTEtfVFhfSSAgU0VMX1BMTF9QQUNLKEczTF9DUEdfRVRIX1NTRUwsIDExLCAxKQ0KPiA+
ICNkZWZpbmUgRzNMX1NFTF9FVEgxX0NMS19SWF9JICBTRUxfUExMX1BBQ0soRzNMX0NQR19FVEhf
U1NFTCwgMTIsIDEpDQo+ID4NCj4gPiAtLyogUExMIDEvNC82LzcgY29uZmlndXJhdGlvbiByZWdp
c3RlcnMgbWFjcm8uICovIC0jZGVmaW5lDQo+ID4gRzNMX1BMTDE0NjdfQ09ORihjbGsxLCBjbGsy
LCBzZXR0aW5nKSAgKChjbGsxKSA8PCAyMiB8IChjbGsyKSA8PCAxMiB8DQo+ID4gKHNldHRpbmcp
KQ0KPiA+IC0NCj4gPiAgZW51bSBjbGtfaWRzIHsNCj4gPiAgICAgICAgIC8qIENvcmUgQ2xvY2sg
T3V0cHV0cyBleHBvcnRlZCB0byBEVCAqLw0KPiA+ICAgICAgICAgTEFTVF9EVF9DT1JFX0NMSyA9
IFI5QTA4RzA0Nl9VU0JfU0NMSywNCj4gDQo+ID4gLS0tIGEvZHJpdmVycy9jbGsvcmVuZXNhcy9y
emcybC1jcGcuYw0KPiA+ICsrKyBiL2RyaXZlcnMvY2xrL3JlbmVzYXMvcnpnMmwtY3BnLmMNCj4g
PiBAQCAtNTgsMTQgKzU4LDE1IEBADQo+ID4gICNkZWZpbmUgUlpHM1NfRElWX05GICAgICAgICAg
ICBHRU5NQVNLKDEyLCAxKQ0KPiA+ICAjZGVmaW5lIFJaRzNTX1NFTF9QTEwgICAgICAgICAgQklU
KDApDQo+ID4NCj4gPiArI2RlZmluZSBDUEdfUExMMV9TRVRUSU5HX09GRlNFVChjb25mKSAgRklF
TERfR0VUKEdFTk1BU0soMTEsIDApLA0KPiA+ICsoY29uZikpDQo+ID4gICNkZWZpbmUgQ1BHX1BM
TF9TVEJZX09GRlNFVChjb25mKSAgICAgIEZJRUxEX0dFVChHRU5NQVNLKDIzLCAxMiksIChjb25m
KSkNCj4gPiAgI2RlZmluZSBDUEdfUExMX0NMSzFfT0ZGU0VUKHgpICAgICAgICAgKENQR19QTExf
U1RCWV9PRkZTRVQoeCkgKyAweDQpDQo+ID4gICNkZWZpbmUgQ1BHX1BMTF9DTEsyX09GRlNFVCh4
KSAgICAgICAgIChDUEdfUExMX1NUQllfT0ZGU0VUKHgpICsgMHg4KQ0KPiA+DQo+ID4gLSNkZWZp
bmUgUlpHM0xfUExMX1NUQllfT0ZGU0VUKHgpICAgICAgIChHRVRfUkVHX1NBTVBMTF9DTEsxKHgp
IC0gMHg0KQ0KPiA+ICsjZGVmaW5lIFJaRzNMX1BMTF9TVEJZX09GRlNFVCh4KSAgICAgICAoQ1BH
X1BMTDFfU0VUVElOR19PRkZTRVQoeCkpDQo+IA0KPiBTaG91bGRuJ3QgdGhhdCBiZSAnKENQR19Q
TExfU1RCWV9PRkZTRVQoeCkpJz8NCg0KWWVzLCBpdCBpcyBhIGNvcHkgcGFzdGUgbWlzdGFrZS4N
CldpbGwgZml4IHRoaXMgYWZ0ZXIgbXkgaG9saWRheXMoMTcvMDUpLg0KDQpUaGFua3MsDQpCaWp1
IA0KDQo+IA0KPiA+ICAjZGVmaW5lIFJaRzNMX1BMTF9TVEJZX1JFU0VUQiAgICAgICAgICBCSVQo
MCkNCj4gPiAgI2RlZmluZSBSWkczTF9QTExfU1RCWV9SRVNFVEJfV0VOICAgICAgQklUKDE2KQ0K
PiA+IC0jZGVmaW5lIFJaRzNMX1BMTF9NT05fT0ZGU0VUKHgpICAgICAgICAgICAgICAgIChHRVRf
UkVHX1NBTVBMTF9DTEsxKHgpICsgMHg4KQ0KPiA+ICsjZGVmaW5lIFJaRzNMX1BMTF9NT05fT0ZG
U0VUKHgpICAgICAgICAgICAgICAgIChDUEdfUExMX1NUQllfT0ZGU0VUKHgpICsgMHhjKQ0KPiA+
ICAjZGVmaW5lIFJaRzNMX1BMTF9NT05fUkVTRVRCICAgICAgICAgICBCSVQoMCkNCj4gPiAgI2Rl
ZmluZSBSWkczTF9QTExfTU9OX0xPQ0sgICAgICAgICAgICAgQklUKDQpDQo+ID4NCj4gPiBAQCAt
NzUsOCArNzYsNiBAQA0KPiA+ICAjZGVmaW5lIENMS19NUlNUX1IocmVnKSAgICAgICAgICAgICAg
ICAoMHgxODAgKyAocmVnKSkNCj4gPg0KPiA+ICAjZGVmaW5lIEdFVF9SRUdfT0ZGU0VUKHZhbCkg
ICAgICAgICAgICAoKHZhbCA+PiAyMCkgJiAweGZmZikNCj4gPiAtI2RlZmluZSBHRVRfUkVHX1NB
TVBMTF9DTEsxKHZhbCkgICAgICAgKCh2YWwgPj4gMjIpICYgMHhmZmYpDQo+ID4gLSNkZWZpbmUg
R0VUX1JFR19TQU1QTExfU0VUVElORyh2YWwpICAgICgodmFsKSAmIDB4ZmZmKQ0KPiA+DQo+ID4g
ICNkZWZpbmUgQ1BHX1dFTl9CSVQgICAgICAgICAgICBCSVQoMTYpDQo+ID4NCj4gDQo+ID4gLS0t
IGEvZHJpdmVycy9jbGsvcmVuZXNhcy9yemcybC1jcGcuaA0KPiA+ICsrKyBiL2RyaXZlcnMvY2xr
L3JlbmVzYXMvcnpnMmwtY3BnLmgNCj4gPiBAQCAtNTksNiArNTksNyBAQA0KPiA+ICAjZGVmaW5l
IENQR19DTEtTVEFUVVNfU0VMU0RISTFfU1RTICAgICBCSVQoMjkpDQo+ID4NCj4gPiAgI2RlZmlu
ZSBDUEdfU0FNX1BMTF9DT05GKHN0YnkpICAgICAgICAgKChzdGJ5KSA8PCAxMikNCj4gPiArI2Rl
ZmluZSBDUEdfUExMX0NPTkYoc3RieSwgc2V0dGluZykgICAgKChzdGJ5KSA8PCAxMiB8IChzZXR0
aW5nKSkNCj4gPg0KPiA+ICAjZGVmaW5lIERESVZfUEFDSyhvZmZzZXQsIGJpdHBvcywgc2l6ZSkg
XA0KPiA+ICAgICAgICAgICAgICAgICAoKChvZmZzZXQpIDw8IDIwKSB8ICgoYml0cG9zKSA8PCAx
MikgfCAoKHNpemUpIDw8IDgpKQ0KPiANCj4gVGhlIHJlc3QgTEdUTS4NCj4gDQo+IEdye29ldGpl
LGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0t
DQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlh
MzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlv
bnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQgd2hl
biBJJ20gdGFsa2luZyB0bw0KPiBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBv
ciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IC0tIExpbnVzIFRvcnZhbGRzDQo=

