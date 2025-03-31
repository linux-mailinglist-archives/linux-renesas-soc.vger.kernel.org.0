Return-Path: <linux-renesas-soc+bounces-15177-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F8FA76729
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 15:54:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 839D1167B03
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 13:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EACA211A35;
	Mon, 31 Mar 2025 13:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="aPnoghcE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011048.outbound.protection.outlook.com [40.107.74.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235BC211278;
	Mon, 31 Mar 2025 13:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743429281; cv=fail; b=nq5F7gzMAhdOthQsrRXaQZtoV3DrAfLilLf9Bk63hvW+dhjaH2YMKqkH8pdtkeHv1ftbbDopOu72ZnXNTTbkdOebPs9j9Pz1c6NSYcyROENgw5xCBZY3tMXsCj1lD0uH7fR01QcQtm6WBK7FI6RzglEWwokqU1fVPyKt6rbnF/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743429281; c=relaxed/simple;
	bh=4aE9IMMPJzvReBwapdY5rjoSQE9FNgDfAzK/JDux0/U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Y6UyQcwcz/BcoamzpETzBJwj8coL9ACNHb8E7N+M4trQOSNJpYmvSL14ix7JohrJWLZCTroTYrpwyfJDDVsr1ex5idFA0e3EN0XsEJby1oJ46EvjY2qYroFUl+mFN2ykPqoNWe/wRsSOLonBVSHL+4nGrQ24rd9L3GClfKjaVRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=aPnoghcE; arc=fail smtp.client-ip=40.107.74.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ks1cIvYhVJpG9ao78AbxTkaOqSYJA/x2ZTBXEVXZFpLbSUksuMpLr5spvmknTp7LpTozyn2VURD0nHZAiiPlf/F+Ussro4StqTeoQPtCcyC7/PXfzAQCDwcTPYSN7DmiOKTBptkk1DI6CWQBamK4KbxlG6xd9wTXAGGSm2UCXEuzTnhMXxG8jNXVaPCJgMvzpchlLlLk1zULbahHjnzUQcmrwzRdvfu0FzOTjjLl78Pr9WdIWtDdrJNACUuW44lGzymN5R0174lqSIuJRM92N6TDkeKiuNRH/llLRLVJ+OSdlaSSqJ5Tzyh+hGfRnZ08VuMynFq3FHZvRcNw3HSutQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5obWm6TU40N5a3mtuPH8YjxDZzMA8FbAsVEKtJ0S8UU=;
 b=y5LxMHUtLvdIrfvP5DXcaOMPsxaZ4sfzKEdf25Oe+wNTsDHn4X8k1aHv2hhwUbutdolJqot1BbCi04e7aJeEDN1Lk8XY/Faekaj3CGPQO3K+0t0PQdIypDLlcr3z7Ct/x1zePVVLlx4bjG+4G5SHz3dqZL+D7DDYirEttR2AnrhffzKIgR6dnQYBTfdEg3zeF99kdpqfIPfwuLUoECbPwGQjk3rXn9afW8zOxbvclEhAMiXcN8MwSzGvsbjN6R84fHldKPHIle1hVvNcaTJe+iXlMnlAae996axrxAytHWoRAe1b0AnyC90H4LWuEy5yDsnL3gf98p6JPl2wcvBDsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5obWm6TU40N5a3mtuPH8YjxDZzMA8FbAsVEKtJ0S8UU=;
 b=aPnoghcEBWNpnu9tWrHsvn+HJ14+BcVBirUiIu9hYDcD6xO+gdlZi7w8yl9jh/tEVChVD88P09QGIZfSpgkGyVnhAFVpVXvKdB8Ltx4zHtnrY0OK+WTZFsHkn9XPvanCDwD645rnIvnugGLs4/jkU9RogVsuYM8n3sJ6Uo57WjU=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by OS7PR01MB11485.jpnprd01.prod.outlook.com (2603:1096:604:240::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.37; Mon, 31 Mar
 2025 13:54:32 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%5]) with mapi id 15.20.8583.028; Mon, 31 Mar 2025
 13:54:32 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Stephen Boyd
	<sboyd@kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v3 1/9] dt-bindings: memory: Document RZ/G3E support
Thread-Topic: [PATCH v3 1/9] dt-bindings: memory: Document RZ/G3E support
Thread-Index: AQHbknnX3xSm7+VbqUS1k2gBBCFIfLONYJ4w
Date: Mon, 31 Mar 2025 13:54:32 +0000
Message-ID:
 <TYCPR01MB11332F064115080582332B78986AD2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20250311113620.4312-1-biju.das.jz@bp.renesas.com>
 <20250311113620.4312-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250311113620.4312-2-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|OS7PR01MB11485:EE_
x-ms-office365-filtering-correlation-id: 38ffc318-d7b2-4890-0016-08dd705b9096
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?MXJQKEIELMksxx5GAGJE2wbwzTtiBSK/2o1X7wiBOTMu4saQD190UKtFHRgq?=
 =?us-ascii?Q?wf8U4a3FyZLJJVK1S6gh3J5pKNPrNpVvfzcy/OA99bCf3p3MHf1D1sSAEhtl?=
 =?us-ascii?Q?YQZVCUG/GBIBBle/4ZfU19Zw9gQYzoB2elE8AWeL4+nfPrX9ajSg2af6gTbg?=
 =?us-ascii?Q?TZ27iWnpf3hs/MFjuKlZTYpmjNn6LhfC8+s6cDxX8fZi/c7VhgeaBmSbLiH1?=
 =?us-ascii?Q?hymK0iebtDYad29qvRTzWnclS/t7FFko3MGAeE8miqStGiZop1L+1Jr0wdO2?=
 =?us-ascii?Q?SZPv7AF73CsvATEm6OLnSPWBUP1Aj9/qNhlyBXXvJiDhV8/9zbPV8Y3SmiMo?=
 =?us-ascii?Q?23fFVq615xgKx3QnMuoO3zvhwhLHBHn9RDTZE8o+/0YHv8czH2IiYgo54sbE?=
 =?us-ascii?Q?6m62DVnJMJjYA4zlqTdo/I/Hved+nG3S+9uq569jK5u8qnLu31q9tuPsSMxP?=
 =?us-ascii?Q?4CxUDDHClVA7nC7lM1yF4HTnk5LRpyC278Mos86Wtu8YSu0VmTJlexXFnSRd?=
 =?us-ascii?Q?o3xYGjnIW7oHVOHKiTbc9PiY+E9UKiVkqfr77APfDpmG4Pay5KSytmoYPDt0?=
 =?us-ascii?Q?2NGmz2mExWjxs6ww2dW5UTuPeAKE0AgsowWcreBoMBDS3KncWMgvFcxfBpzf?=
 =?us-ascii?Q?KA9JUkLcYmlmVceTCVrqLD+CjJe62F49HScW7imKCoSl622+6Tjk5eT/yQ0F?=
 =?us-ascii?Q?GPvN/sKKQlBvs5BwThMWmNuwTjzGUrrFkCvhFFw9Tnvg1TQpqgicLIY0bdLm?=
 =?us-ascii?Q?k68tUT5YBXTiUSzvc1pOiK6yebNciH43YMCLJEVTu5bH+PsgRr/zqUIGX/b3?=
 =?us-ascii?Q?dECbJ9ucI55VqjMJHZmv/KSF8qKsKplXv7SnNAwNaICRE9wHrnnrTNTFoaUu?=
 =?us-ascii?Q?AmNyE93Vcp2dUKFJXTmLmXolUfp4yfCuXkPGUujU/Zlx7ppcRAMgSW+ef+Ge?=
 =?us-ascii?Q?n6a5FRK/Tlscympl840hpZIdZ8Q9nh/FODuQlj7Thtf5oYAZUvrRxYYH9eVr?=
 =?us-ascii?Q?I3GXsereVoKeFtmPkPZ6duUgS1dRh3ERQBD1/MHr0/R9H6dwbT59lXOEuR8J?=
 =?us-ascii?Q?EsNnxrhnpy2/EZ/eIRMNIsRLBgfTcA7Bx2grleqatntouKlMLQ6Oq9o//9AN?=
 =?us-ascii?Q?kP7fe3KArYGTzZ3tuAQPmiheq07yQU/NZq2UbDt8tYZaWXlcSU7yxSVJ1arZ?=
 =?us-ascii?Q?GJ9oAgyGG1WuPt091hRQDJu/JyNI388b7hLIGkD8cGC7HkCafefaggjhPL7m?=
 =?us-ascii?Q?vHglHJVqAuoWc+NPraY10KFkFMuPBRvIhFwhISJbga1iIlBD7M186lggluzd?=
 =?us-ascii?Q?qnRvIqAnQwf9q3sX2rpqVdMs7TTKvmGgRy9nRYoW1Wnv/C4azubzV4zrKU55?=
 =?us-ascii?Q?Y2pkydx6DFVRw5nn7Ryf+X3GOtSIrXiHAgcgU+a5WbBf6tNdBQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?SrvfQhmauqYP6H6c7nac56fG2ZkxEY/CIRpapi7C4cuW5t1KuOQHhY+be1DQ?=
 =?us-ascii?Q?vZMNKWX7KXlzzMVBECzmq+6klJaATZSzsqXgpa4wkba/IJimZWUN8BwowALN?=
 =?us-ascii?Q?YWXEp0rgSrid8wAoFQz+cWqanX1YNXJKXV2xtYbYu0H86NTjbtUDldUObnXC?=
 =?us-ascii?Q?Wq3hnOKtOKFhuMgPM/Z1wrvB0E9b9f/RdPTn2Fy3WQJwMKqQxiHrn2n6TBBy?=
 =?us-ascii?Q?rXdlQysczKs+hRUaMP1GWq6kw2mXHVrUamktkuQcqXptGl2US6xV2cZEo4h/?=
 =?us-ascii?Q?2YHdVoVsCbifHfllPL7CAkXsIYlN4RT0zKIUZC4CAPYNr1uvNiY+mF8D8iMi?=
 =?us-ascii?Q?In/m2J8NwMvIpkobiP6A6fS1/TB8p5s9SwqVX2olH9ku1+O0kzZMgrA2g9td?=
 =?us-ascii?Q?hm3kNcJpsLXk0944B+gjiVNxtGv624oIA1JjrtE3Hm+C31DmxmPJdYypbD3L?=
 =?us-ascii?Q?DxJ+CoT62doDEm7HHmEKpANgQ7lxzKqzdIR/2e28InNAZ3OIM+UWRIVVHDJk?=
 =?us-ascii?Q?H0UrQdE5ILRpflrj0cvIzBIK/nJW8dh8wSSo3wxhi7kAiBleVvVomoI36Hda?=
 =?us-ascii?Q?FGU03uf1EKH8glMpJA+VUWal6hAz0KOj+K2+DCFR2kCuXlSn+uvAvJTyfqRB?=
 =?us-ascii?Q?TkkbWwPhGEf7f5HUsMpx/CDs5MKW5eDJeEwDXelm5bGQvNTFf2wcKCnKVMqk?=
 =?us-ascii?Q?l35bjIpDNpnPrGZ/0hfTNsfv5a8JXKj0/xQyZQjiIYJZWEbAIhmNH+cVBDMG?=
 =?us-ascii?Q?IqNcnagL+fEAFOaThRanhnPWcp5of1ASa9OeutxPB56/L3Vhqem0Pu6U6O4O?=
 =?us-ascii?Q?vLquU9faSyoWEVH+KLQNjmIm1iO3QxtpvPObHvs85Zi9V7PhY/EtGaq/f4iM?=
 =?us-ascii?Q?S013o0M2Y0EhHY5xVwyjii7/teloNjYcbGWSwokGp4jVR2s5FaH8/xZmVcc+?=
 =?us-ascii?Q?PpQXRu1pUUbUum77J9WIRsPHgqJ7MYHO+ArP+0HbIF28lgfGFcPOTJhqcn4Z?=
 =?us-ascii?Q?3zjlDe8vQBsgJRxo6wovqW6Vvg1i8GzXxmi2o4s/w7l6GxLYTs9riBiwmGdO?=
 =?us-ascii?Q?nWLJuAoJqjLUhXrm7LSxZaQPWgN3zaYA5xPzxlspxWdxZ5+gyTVhw1bvhnXh?=
 =?us-ascii?Q?QqcT4sFO2M0WCQXGfCvRPTmjSRj+B4r5XdewfdL6Cijk5fr2+y0qD/NgNJDR?=
 =?us-ascii?Q?LwAZtUhEvJ4N9xXP9RHT3bKxyTDbQP6oqHRcEl3C2K1+dFzJHhMwAUJ7R9ws?=
 =?us-ascii?Q?YF3NvvmO77kdI7+MF8oiTzcUZcBx0OsSuxe1I+nM7J8tp/0zUfT/LXszqmBb?=
 =?us-ascii?Q?e1fB/ALzADWuHfT8VthynuhH/IBBvICzW/vo48Zp91Co14TK0bzii3t88faK?=
 =?us-ascii?Q?dLybHdg7XKV4Eb2PFys5PitvLeoavVwqmN2k3FlnviHWj4fETfRht9OQAsS7?=
 =?us-ascii?Q?2HDO1IzjJ9QZfss1K7unOlloNFiBPXUt2DfLsqkOGuA5igbjnY0q0cXiCO4K?=
 =?us-ascii?Q?zNTc7QmLHk1q1bxMgr+FN/l5pE9iA8qDmNMBdyYMVLB0Mhe4BrWZJwcpVOm7?=
 =?us-ascii?Q?s50E+GAHi1FdYFpVbydvqki0wsKwS2LAzsbRqwfUQ93Y1HJiKivrn7jZIykM?=
 =?us-ascii?Q?Hg=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38ffc318-d7b2-4890-0016-08dd705b9096
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 13:54:32.5995
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hqQw4o3Ztco0HHH3Ge3dkw1nzsqzctW/mtTzIb+ZfDASdWW8OIXcehFhsfCNnntSyp1dJDsFRiKQIAEX31vdL0yHHI69p4oEXaZTp5PBl1U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11485

Hi All,

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 11 March 2025 11:36
> Subject: [PATCH v3 1/9] dt-bindings: memory: Document RZ/G3E support
>=20
> Document support for the Expanded Serial Peripheral Interface (xSPI) Cont=
roller in the Renesas RZ/G3E
> (R9A09G047) SoC.
>=20
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * No change.
> v1->v2:
>  * As rz-xspi is too generic, replaced file name rz-xspi->rzg3e-xspi
>    and dropped generic compatible rz-xspi.
>  * Dropped prefix spi from interrupt names.
>  * Updated the example with above changes.
>  * Retained Rb tag from Rob as these changes are trivial.
> ---
>  .../renesas,rzg3e-xspi.yaml                   | 135 ++++++++++++++++++
>  1 file changed, 135 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/=
renesas,rzg3e-xspi.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/memory-controllers/renesas=
,rzg3e-xspi.yaml
> b/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-xspi=
.yaml
> new file mode 100644
> index 000000000000..4d5aa5812d74
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e
> +++ -xspi.yaml
> @@ -0,0 +1,135 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> +---
> +$id:
> +http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yam
> +l#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas Expanded Serial Peripheral Interface (xSPI)
> +
> +maintainers:
> +  - Biju Das <biju.das.jz@bp.renesas.com>
> +
> +description: |
> +  Renesas xSPI allows a SPI flash connected to the SoC to be accessed
> +via
> +  the memory-mapping or the manual command mode.
> +
> +  The flash chip itself should be represented by a subnode of the XSPI n=
ode.
> +  The flash interface is selected based on the "compatible" property of
> + this
> +  subnode:
> +  -  "jedec,spi-nor";
> +
> +allOf:
> +  - $ref: /schemas/spi/spi-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: renesas,r9a09g047-xspi  # RZ/G3E
> +
> +  reg:
> +    items:
> +      - description: xSPI registers
> +      - description: direct mapping area
> +
> +  reg-names:
> +    items:
> +      - const: regs
> +      - const: dirmap
> +
> +  interrupts:
> +    items:
> +      - description: Interrupt pulse signal by factors excluding errors
> +      - description: Interrupt pulse signal by error factors
> +
> +  interrupt-names:
> +    items:
> +      - const: pulse
> +      - const: err_pulse
> +
> +  clocks:
> +    items:
> +      - description: AHB clock
> +      - description: AXI clock
> +      - description: SPI clock
> +      - description: Double speed SPI clock
> +
> +  clock-names:
> +    items:
> +      - const: ahb
> +      - const: axi
> +      - const: spi
> +      - const: spix2
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    items:
> +      - description: Hardware reset
> +      - description: AXI reset
> +
> +  reset-names:
> +    items:
> +      - const: hresetn
> +      - const: aresetn
> +
> +  renesas,xspi-cs-addr-sys:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      Phandle to the system controller (sys) that allows to configure
> +      xSPI CS0 and CS1 addresses.
> +
> +patternProperties:
> +  "flash@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        contains:
> +          const: jedec,spi-nor
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - resets
> +  - reset-names
> +  - '#address-cells'
> +  - '#size-cells'
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/renesas-cpg-mssr.h>
> +
> +    spi@11030000 {
> +        compatible =3D "renesas,r9a09g047-xspi";
> +        reg =3D <0x11030000 0x10000>, <0x20000000 0x10000000>;
> +        reg-names =3D "regs", "dirmap";
> +        interrupts =3D <GIC_SPI 228 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 229 IRQ_TYPE_EDGE_RISING>;
> +        interrupt-names =3D "pulse", "err_pulse";
> +        clocks =3D <&cpg CPG_MOD 0x9f>, <&cpg CPG_MOD 0xa0>,
> +                 <&cpg CPG_MOD 0xa1>, <&cpg CPG_MOD 0xa1>;

On the next version I am going to update spix2 clk as
<&cpg CPG_CORE R9A09G047_SPI_CLK_SPIX2>

Based on [1], the clk specifier cannot distinguish between
spi and spix2 clk, as entries are same(gating bits). So, treating
spix2 as core clock to distinguish them.

Please let me know if there are any issues in this approach?

[1] https://lore.kernel.org/all/TY3PR01MB11346B3B6CFF1359411B475A386A62@TY3=
PR01MB11346.jpnprd01.prod.outlook.com/

Cheers,
Biju

> +        clock-names =3D "ahb", "axi", "spi", "spix2";
> +        power-domains =3D <&cpg>;
> +        resets =3D <&cpg 0xa3>, <&cpg 0xa4>;
> +        reset-names =3D "hresetn", "aresetn";
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        flash@0 {
> +          compatible =3D "jedec,spi-nor";
> +          reg =3D <0>;
> +          spi-max-frequency =3D <40000000>;
> +          spi-tx-bus-width =3D <1>;
> +          spi-rx-bus-width =3D <1>;
> +        };
> +    };
> --
> 2.43.0


