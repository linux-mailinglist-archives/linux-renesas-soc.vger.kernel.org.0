Return-Path: <linux-renesas-soc+bounces-17103-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 180CBAB6CB6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 15:31:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA37A8C78C2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 13:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDB91277807;
	Wed, 14 May 2025 13:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="eRiWeiiU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011062.outbound.protection.outlook.com [52.101.125.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F62415AF6;
	Wed, 14 May 2025 13:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747229376; cv=fail; b=kyVetCmUyCsGv0PIYysR/CD2Qg8Eldqz5I/izvSeZs6pEa4a2R4nKR4oROKVoBtb5fAifUztwNGVpHl60vxw0ECU9syP8391Rl7SCRk26OGxplxgF8I/qsN1sKu0+FyRXbZA2r2rYaRqaY0VceFfcyZ9qKbKZolxe0B/f36fYrc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747229376; c=relaxed/simple;
	bh=O6byUl8ZwEmsCdRt4Bfok34ZPfiN+E3SibMAX0FPMOc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QrZs3S4N9oVSoXPQlZAliKF9F18mwEjgcb5xRr/saFJWVDJBhUAC8pEQ70J4RHiglCDcX7C7gpxD3nTKd0uTv0whhii2j6xYWSy1iNKpEJldflzU7ai0BnO2uKEBb0QkPA3Gmv1IvY1T40tzOie56s1uvUpfE2JabwbcGD0NiBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=eRiWeiiU; arc=fail smtp.client-ip=52.101.125.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TVschspfSdY1xzBxk37TnFM5GXBkdidk7rOPQvUvP+boobLqRKVKh28HDQuJ0Q6lqcdwuGnvitwCWySHHtW8fggu+IaOee+A3HkP+pqNtPuvzkRIRyNWh4qWJ0Tm+nb+qEJjQnuSyyqKbSvutIqpK96/t1cJ6rcxjEY+56TWm4duhrGqPgTeDKtTDDrZDdUaEPT0P/RgOJcX2PVgxK0oVC8I3nguUeDjbDphFBYw3VSwEWv0Hrv0jeFIuVSzXDRloyFy2asGlq0NHe+6oWC6N7VgaaAl/gO5sN51D9+aEOaTKKKEAjkOW+sbU5TAkw8FKheiUa3Hlo9ut3UTv064Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=67dzPMOqo7aI9H2mUwGia8T2G4y7SmytFF9Qgi+Ybnc=;
 b=Wy8hAPkFq2Fy4Xe42+yt133s7EA/7WAm+dDxP9zAdE2oRMHinp2OuUjsACAvIrf9RGLIx0RhBzOaWsSnj3oYCdQGW3XZEHbtQipl5TFLFLQDsoiQYVkzMVvWC73aaWcudvdM9CgpKK4Up3GCqcEES4BvaHiGCn7niJD7B5yb/t29Gy33fctd9km6zsrc7uDPLki4y1V61SgTruwxyBVnfqhZMt36g4ya9VOukq7QMj6l86ZAZBSVj2AAtldsTxzkOK0sGFdZinWMK/VzwjnvQpxU62WfTUjmIAdniKceYplKfdg5mmBaL9hhB3SOFr96Myeky6M5zI9yiYRqXokzzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=67dzPMOqo7aI9H2mUwGia8T2G4y7SmytFF9Qgi+Ybnc=;
 b=eRiWeiiUL5OSJ1yhyaAuAOXXqa8FaaWxjWc9sC21qtFodZR/8HmVwh9S/4f38fuVyj60YLFP7KAJ6qB4omE3w4c5U51r00MAVAemMWGV3oQhrFeP+sjFa2LLLaaDUUZOBKfPqcaNNV5GJ4uaMinBoOmp0eacGO8LS4tQ7bafd7w=
Received: from OS3PR01MB5896.jpnprd01.prod.outlook.com (2603:1096:604:c6::8)
 by TY7PR01MB14734.jpnprd01.prod.outlook.com (2603:1096:405:257::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 14 May
 2025 13:29:30 +0000
Received: from OS3PR01MB5896.jpnprd01.prod.outlook.com
 ([fe80::1b62:57c6:c2cf:641b]) by OS3PR01MB5896.jpnprd01.prod.outlook.com
 ([fe80::1b62:57c6:c2cf:641b%6]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 13:29:30 +0000
From: Chris Paterson <Chris.Paterson2@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Magnus Damm
	<magnus.damm@gmail.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH v2] dt-bindings: soc: renesas: Document RZ/V2H EVK board
 part number
Thread-Topic: [PATCH v2] dt-bindings: soc: renesas: Document RZ/V2H EVK board
 part number
Thread-Index: AQHbxMa8ONK3XNiL50uwrwaNSlaUyLPSHivw
Date: Wed, 14 May 2025 13:29:30 +0000
Message-ID:
 <OS3PR01MB5896A7583CC7103AFA5384ABB791A@OS3PR01MB5896.jpnprd01.prod.outlook.com>
References:
 <0a264c102c615e0a1bec2e45cba180298643520c.1747222771.git.geert+renesas@glider.be>
In-Reply-To:
 <0a264c102c615e0a1bec2e45cba180298643520c.1747222771.git.geert+renesas@glider.be>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB5896:EE_|TY7PR01MB14734:EE_
x-ms-office365-filtering-correlation-id: 72adaa06-4c31-4b5e-1512-08dd92eb5b71
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?mFzYphRBVfrmLobSsVCxtHyuAVhY8Aei30OP6D+P72zoh+Es5KuJ5HBZ?=
 =?Windows-1252?Q?IFjI/IEdbfrmdt+lOq1D0kCyCmVmnh+TDzxRw3469E9a+j4oq9MWpqCp?=
 =?Windows-1252?Q?I2yzo4A82fuoPXtmiD7GdoEMYe1Kf1MyDaAby5DWt/5i3JHBit3saZnS?=
 =?Windows-1252?Q?nCkMkmXuN44BXa7qvdySIFDASU0Eia/hYaUu1Pob4EnISnBHlyYwYfPm?=
 =?Windows-1252?Q?3maQQHv6vVLrPS5C3j5LnuJSkYjiIUTIarxhdby17t0saGd6e4TLASat?=
 =?Windows-1252?Q?iGK5QOTv4RvewYoxI2HgR8pVnlbdcbbWFsuD9ANO72I/xhS43VkGsAIw?=
 =?Windows-1252?Q?4EFIHnb4QRUCT4on/rLzwejT6yIAGJ46KDjQcarKtnw/ZrGk8qqfLkDo?=
 =?Windows-1252?Q?sg22ETj6LtZWeqO7vsrpXgVRR8YAit9gqNbencGwdv5XjbIeLETLiojW?=
 =?Windows-1252?Q?VvqQc3qL/xC4bCGFopA/9i8C5h+trZxl9iZpT+hCYof427ir7gOWjk8m?=
 =?Windows-1252?Q?r54oF74QbHf5uXCU+jD5mRtuncorp0IXDIcE/CtsjUdMVPGpjOXPlPmt?=
 =?Windows-1252?Q?cxwLMYkf/wxX3Tl0XmbiC/Bg7NO4crcIIbITnS1qye29gFhvMeEq3UYT?=
 =?Windows-1252?Q?QfpTHXyGdQRzZfLwpAn0l7gDvEqdZQ1uD+7c/fN4h1zQf3OoDwVL6NFi?=
 =?Windows-1252?Q?s0GlhvXZ3KX50ikEeon2qhL3L7E2l3XcFMmLPpk3wY9QpLOsOo6zQ48v?=
 =?Windows-1252?Q?rLbZzSrvcn+ipvliECg1U4O8TqEGox0NjLtxsoIp7CgmoOPgqTjPvp+q?=
 =?Windows-1252?Q?qG3zBJVemLdXMb3j3yuoKbrhLXvEvBp2MFOY1K/NTGyVDv69vPlGhJxA?=
 =?Windows-1252?Q?hRhu6HoROTFSaxw2WOY3Pb2Zqqt++m7bGFniKZcivWJhVe8Wm8j5VJm6?=
 =?Windows-1252?Q?zrYxITSk3S1U9oK3Oqj0uG+6sGGz9eGg0c2Q+QcTSeKhmBPTjaEyuuVi?=
 =?Windows-1252?Q?GDvNGJz3IXVD8BP94DoX80zLGTqvtZKpKxDruHQLmVgJe/HOJfOlKnWp?=
 =?Windows-1252?Q?RhomtDpvJ89xMFJ6g9m7Pr+FXcSCsvdfnrm8O8YxYUdF8gA6aeDuYRqY?=
 =?Windows-1252?Q?x99We1V5D+J5YrW02W3BblzCO0PQzMJHmkuQn47EZH6zJ1oe3RPWOBfm?=
 =?Windows-1252?Q?JhgKC4WKJEPPvnhkcsiSVE+2Mtt0N9AHubvjWr6w8v6tghj5fGZhQowO?=
 =?Windows-1252?Q?6wmW/8peXFLtjXU2YkSuRftpMB6BDvfhjHkIVntyIx7gbsYZ894BeJ8n?=
 =?Windows-1252?Q?zx/BUTTkf4X0Q+XMCfClweQF9uV1mNA9RIb5EBy/i/UZ2xPUgRkdIJi+?=
 =?Windows-1252?Q?qFnJVWNLtAq3cegjP5Ktfy62KZb1ippiq0krz54f1x0uw0WlBwux87uh?=
 =?Windows-1252?Q?SsaSleJWvEyydfsObi0eUqYgg4MFpyHH1NVsXdrSoqa6Do53FK+r/KkS?=
 =?Windows-1252?Q?yuVFTogs6A5qhxJzv79he5MxXLxU5T6+x+Ygy7KSNk6AKyfMrXfDUFGf?=
 =?Windows-1252?Q?tT+w50DlZ1lDD3ALJwqYiKa2Srwuh41TyAJZ2SKgk4s4mTgn+dZ+X5CK?=
 =?Windows-1252?Q?P1I=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB5896.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?9FKGABP575TCnLQ5yOXCYDyagYT41X77SRmv6A9ZfYOX4WGzu6cbLfvk?=
 =?Windows-1252?Q?L+9EOVF5gz5jwFNm/X251COPZZaF2Kw2kGTI3rysndy+SA7T6alaQZ+a?=
 =?Windows-1252?Q?TDdmTGxA2I8nrHRZP8Um8NLJeb1DdTqnUqOdQFNZh8P/SnRi3zNR4xqw?=
 =?Windows-1252?Q?kQGXE0EiuFULPUZLXJZnRhbB3l1FPhaO2dbNXalKY+Cn8a7tY/NVgpZK?=
 =?Windows-1252?Q?/NQ4YB/PLFNL4jX1Yt5RN+JyhFIhmklBTuNSDf9QeogPjhs/w8czhjl3?=
 =?Windows-1252?Q?Zx1mlNRkwiWOpVTpBYlrRdlD/N2VacxUVUSc8E2BP82uYMabweq8hGLV?=
 =?Windows-1252?Q?flmgAXuD4zxlVeIqV0byjud++rDs/7LVd4/fJn2dqVo1JdPnQOd6/siz?=
 =?Windows-1252?Q?BBPWSiu9RW6LsMRIkxtABbgsmXEqnx0WgsTnltflZJSko5wc3HWDx11B?=
 =?Windows-1252?Q?FiSdwMSLTWCIt4E1X6cgz488sA3tnOtIpUXhwS7q6yGnK7uya44qrASC?=
 =?Windows-1252?Q?MTfmtgRQukjHTCfzQ9lbVoiBbiU9B/7YNDsJb+kLh5fCrMx6OczOwiUX?=
 =?Windows-1252?Q?j6hD4uJw69ubzHkR8Era8NH47aTfO7T9FME2d6D8QAgP1vdqlV5ibZka?=
 =?Windows-1252?Q?2ar7YyCqqQVsBCdOlwkieYUjz2BDmpWPmJWeB+4cYgao6gXvfLOB5znm?=
 =?Windows-1252?Q?kGl432XGVTMJoUMF+PtvI6ouvoy9lED4i3y7KuVPxhHSLW7wjLrtSp6n?=
 =?Windows-1252?Q?swO5jXQC+CeERummlVBKwsugSzEN5U4rFr+ZAbOwtCP+AlMMTeM3YC//?=
 =?Windows-1252?Q?6pjjGyu5nouvErSKENFaVSaXSk/XARsRXeqks1UZZRbggcvsLtzRBBFF?=
 =?Windows-1252?Q?LI+m7qfbusow4QYsn2AFQn32Qwmp4yW21ryT2dT2DjwVOBvmCr0ik7vi?=
 =?Windows-1252?Q?y5MIhoxajazLgtQJMCcmnzjd77DaZZ7mjCVmsEgWuMHXGJZNk+U+e7Is?=
 =?Windows-1252?Q?KccWwjJBz3vYeKIYyRAlU3a0s/6W8/LsM49xwsRaJKpo2Ojxe3F+u9Mu?=
 =?Windows-1252?Q?RToXsaZNJ9yRq/vtsz5qQYU7TcYiqKuBLGfNNbW798ZkjYxrp9mNogRy?=
 =?Windows-1252?Q?TcRVjPD+tS+tC6YGOyz1xEgGSMhDc68S6akH2ssFbsm2y7qYm6JSNow8?=
 =?Windows-1252?Q?4fAEmJuv60dU6BYI/vsE+meA2BtvO1q49r9WcQjQMn4qc8mS6sihYjh/?=
 =?Windows-1252?Q?icSlLRsL0/+VyX1h46siMSMLxQWHMVCrMGmEDZ222/LfwUBSxp+nQsda?=
 =?Windows-1252?Q?HggBjoc+5pDPLE0a7lhW067mdERbEtWKrUEdAFcHmjpYHY8DqI81VRRI?=
 =?Windows-1252?Q?OtAnSZlcn3f7rdERTWGzB+5AESBep3OuBpQyg6O4lCO53EFh004jUltO?=
 =?Windows-1252?Q?gjv2LNxxQ+1FD3KBYpje6puKnCSYKLG6tNmeNShNm3dVEjrS1Mq9seMB?=
 =?Windows-1252?Q?WMOcr8ZLIqqQJpTaVRigXXrkffN518Pw3itOiETWnOwXmS9pbSBnLqZW?=
 =?Windows-1252?Q?oMZUGvSJAp189vL4R6BJUS3rZcumAoYdQ9irsLOeR5fQVroIlkFVr9XX?=
 =?Windows-1252?Q?hQP3gq6TwehmJOBgWWQWuGcbBhzf6o1p+8DE76eb/uWREZy8qry1DGak?=
 =?Windows-1252?Q?gKkmDNxVmu+ANHPpMEChvPMneYIg2E6M?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB5896.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72adaa06-4c31-4b5e-1512-08dd92eb5b71
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2025 13:29:30.5525
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /VSAKpkRjwDmbvEEuL/fGldRwjKajTe9r6l5LSY2QH3R4t7wStlGhxEWhBEyhyEk8fTvg0hbx6yCPKmVdoyR74BX5rBEFbGQMlrYg/C5vXU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14734

Thank you for the patch Geert!

> From: Geert Uytterhoeven <geert+renesas@glider.be>
> Sent: 14 May 2025 12:43
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in renesas-devel for v6.17.
>=20
> v2:
>   - Update part number to actual upstreamed board revision.
> ---
>  Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> index 5e6e6e6208dc552e..f074b5c35c6f7d19 100644
> --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> @@ -576,7 +576,7 @@ properties:
>        - description: RZ/V2H(P) (R9A09G057)
>          items:
>            - enum:
> -              - renesas,rzv2h-evk # RZ/V2H EVK
> +              - renesas,rzv2h-evk # RZ/V2H EVK (RTK0EF0168C06001BJ)

Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>


>            - enum:
>                - renesas,r9a09g057h41 # RZ/V2H
>                - renesas,r9a09g057h42 # RZ/V2H with Mali-G31 support
> --
> 2.43.0
>=20


