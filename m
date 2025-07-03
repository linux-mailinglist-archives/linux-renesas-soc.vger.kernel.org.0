Return-Path: <linux-renesas-soc+bounces-19059-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DD5AF6934
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 06:52:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DE031C25915
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 04:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46CB128DB54;
	Thu,  3 Jul 2025 04:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="j8XA9g+D"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011025.outbound.protection.outlook.com [40.107.74.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB751D54D1;
	Thu,  3 Jul 2025 04:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751518316; cv=fail; b=T4ibNTKxKuzsDfJoJ20wUPCzeS35Wc8axEQTOE80VAX1JIlwHFgEcmWSN43vzkb/dgsI0oslAWaT5mt6JUbvca7TlPYrSz9FMeek4jaTAvytXYYsLlvk8YRNrUi6DTcgNYl8ODxM3lbf8Cqkc0ja8/yoD2LGTXScY62/lDZB/2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751518316; c=relaxed/simple;
	bh=CtPIakbD0RDTSS5ebztF7I1tybX9cvEeab2TF8DrL74=;
	h=Message-ID:To:Cc:In-Reply-To:References:From:Subject:Content-Type:
	 Date:MIME-Version; b=p9uM7pEHsuzQXrBrQnh9Lv7/y79iR0YENTPdijaoIVvJvfxQrn8oF7GrfIedrIrfdBw2eZbiLyfzO17RlgMMB3D+rX10JnYyljiA0vnqQP2vpSreOrBdep3KPG5JVLOkt/SC5+aQo1noql354c0WLhVPT28QYie5Yd043GdytGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=j8XA9g+D; arc=fail smtp.client-ip=40.107.74.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mGMXE7XZfwDM+AQHcioDxZyGVH4NpgFPNFV00W+B3n90+DUi0OLr/tiiUPcjvXSjpwZQgmW5UgIt2t+maD0d4Y/ZmSts+bas6ajJech5cY3/dLVV9GyoVrNUy9bm2JhPfgbwwBWZskCuYkkGeFcoAUHbaGYRO0/s6U6zD7h622fqBBOf6a+EbZ0l8grko8JP6NEOqI53a18MlqYxWMhhJx79jfaHhpp37eNKkvL4E8mTiqhTxlaEhSd25LXtbj5iJLMKoqwnZxcwJUv9e7D3mQ2gW2RfhcE5zZ33FZiTADTYnuctfN99+cJYdIianK/mYbwXBarL2z1lD5w64rOxpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VxZDiNcWuJ+aLS/rb4MFbl5OsqVk03iKue4A4sfdN7w=;
 b=Wab+2wr7xoW1qaJMkL6PswdnDL64rc+1Bv6nyC4Qhbt7pt6EO4vEiZIt4WcGmdgq07Z2QaebYG06peQBqQSxD75VIqI7VthqdtCE3ohZT99MvuuQTBfGIjZekZmMdwsKXj+Dh5URgHJ/LdBJYsHgMWjfkwwqew35lIm7SFASuP/q/iUlJOBLg9HJpTFF/odwDdHakcMCjDX7/bdgMHaH0QzsKNZE+JGw9Pvca/vz3RY3Yokz1wy3ddB77oxyC7CdF2kV7PzaNB5MVIyVv7zcuzn4GmCzMMn/S9UislWwWxZlUnUHYFnO28fheC9kpYE6U5lQtijQqXnvuS5eXoi52Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VxZDiNcWuJ+aLS/rb4MFbl5OsqVk03iKue4A4sfdN7w=;
 b=j8XA9g+DPlSxZjctCQr6Sdq+Z3eNXsVZxn1gCIJFFc03R9pVN4PleR7XWAYUs09NTo5rTSUyFeV6JzZ/7x/h2ehVxFPfu7cNAPMR8OPBL44Y8k1luhpqNFrICBOd9UiaxpAbw7wRDcRn1vh2lAgRRJOm9SeeUmEDxIBvxUEbHcw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8499.jpnprd01.prod.outlook.com
 (2603:1096:604:16e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Thu, 3 Jul
 2025 04:51:50 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8880.021; Thu, 3 Jul 2025
 04:51:50 +0000
Message-ID: <87ecuxdggq.wl-kuninori.morimoto.gx@renesas.com>
To: Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Thierry Bultel <thierry.bultel.yh@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-serial@vger.kernel.org
Cc: Nghia Nguyen <nghia.nguyen.jg@renesas.com>
In-Reply-To: <87frfddghg.wl-kuninori.morimoto.gx@renesas.com>
References: <87frfddghg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/2] dt-bindings: serial: sh-sci: Document r8a78000 bindings
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 3 Jul 2025 04:51:50 +0000
X-ClientProxiedBy: TYWPR01CA0026.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8499:EE_
X-MS-Office365-Filtering-Correlation-Id: 47b7ea07-4871-445c-9cb8-08ddb9ed52a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YrMtglwKqgyEQBIDmXpX0eB7mI8lQV4N538aCL6xj4/HxUFacTEGlGNVMuFD?=
 =?us-ascii?Q?+wRP6IKiyZ492jA2NkTyniRsfCYgj1WgEZAGlu4wwSWleKaRdrxzzv+jMFiU?=
 =?us-ascii?Q?tBbbxewfpOwHRQaMVOcWBZxx8TrNbMRTY2L9pzbtDgC/iig20NWLO5hWjnvb?=
 =?us-ascii?Q?HzGk3EFFQ0F3sqrDRu9XTtEycBWaBU6QEbIJzmBmWdkv8F1KJq4OXu6LBrHU?=
 =?us-ascii?Q?d/8Kbtnw2q8dm8RQYPr8KMkuBofXyyL8tUqwDq0QVCe6ofgoV9zG1bREeg6u?=
 =?us-ascii?Q?OeGoXPZeq/c5mvH7UwfB4OHL8BtYJcGPGJu6XtFOxAox5g7BTf4OQMv8KJ4T?=
 =?us-ascii?Q?TPsHNIJaGRAVSNcO4M6o3Ad5ls1Zfy3b260raVZnTdFNg2Mey1A/XlAd7LRV?=
 =?us-ascii?Q?MV3nx0ZtCSPvYZidJElx80QFaybKTcYxwF/MnGeZgNAtKos3JhDSt7h68GTb?=
 =?us-ascii?Q?jLuC+ZAYGlge4djaLTT6rk1CLstSj+SuvmHVwIXmuZvHIPkfn7IoZmxLPyUE?=
 =?us-ascii?Q?LDFC2MIa/NIE5viCnopqEEswOVeaZwX8n0sz38qRQQncKV9JJDhlQudzyxzG?=
 =?us-ascii?Q?+KzikRgLe5tRK/cK3yGpL2OcZ/YEB7B1TVTvwlgfrfCC2bjGrffVbrVk3y0f?=
 =?us-ascii?Q?6L5V3nQ3cNTbrzKij3NvnPJcbqM0tBgTmqhcg0/mSCGzQTpM3CwcWoSzbh56?=
 =?us-ascii?Q?1GZejGy7d37MOF8y+Qi6dA8ElBDnOTsa7ljEl8hyCpqM7EoDodtvuVLxO59a?=
 =?us-ascii?Q?dVs9WB/pJBOud/Qb4D/rVgI+/pCK0/m296qwpEp0cPWUrBUx4Q5VuHljAvUs?=
 =?us-ascii?Q?/9atpnvooSU//9HPJn8VHp4lstxo6HVudr0cAYvkMy8o4qy56Q/Tw+Hh6ybY?=
 =?us-ascii?Q?8dN1soERxb08Bi2LNRIsnVM+1a9/Ge7GbM6fSIs/QvN5gtv7v1Rcy/yo3Ahs?=
 =?us-ascii?Q?sdrHko//8998/3LXOS2IRsu7b0QRyN0xcEw+Y2ufByQcYE4Sl3zinA6Nrb3f?=
 =?us-ascii?Q?q+SRlaKNcwRt8NpD9YB9igZIsujAohATNSWKUJW9q4MLV26J1qKddW37iYR+?=
 =?us-ascii?Q?XDR/7uB9sZfgHj+laB+XjAGQ9r9snls/dsklP3CASS+waxBEmSDQ2aw/Yoyx?=
 =?us-ascii?Q?N+hTfdiHELGtMoiD8aT7TIdxJ+PyCphaMqNZTcAjSyZw4ffWt/3kkozB/8XO?=
 =?us-ascii?Q?RnpJ8aeI5bjWfAbMFjwnsl+Szjcv76gc/pURYtSgaC1o2le1RjciQnzZPsf3?=
 =?us-ascii?Q?9pxW/zmuITdB+hGsft6pl9FKi4OwEVoYdR6EeaWcS58gaye5rnfcsfkmnD4t?=
 =?us-ascii?Q?CRWqcjzbs/xdD2Lh8CvLcU4vrSOKkt3k2ZbITDYWBOomALVALaEb+TWUnR/U?=
 =?us-ascii?Q?/GIEOhFxjvjOLBxeZzveaeZXIb3DtA4Rd2gtbI5PqUwg23v29Asa/rp4PD0i?=
 =?us-ascii?Q?X4G3Hw5wIw2e2j1g7t4Jt4UdAqZ0TgUbpl7kpX5BzXtl0DFxw16E+1XYENRL?=
 =?us-ascii?Q?+7g3uzafiSwGQZE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dxlRBkhj1J2uhmZrwyixQWK0UBe6QiQNa+WfL5OkjX6gMaQWUb4EHQ8FZzEW?=
 =?us-ascii?Q?bOWYchRyU2/GlPgNaieoadAg82CN9hRJWxb4FiZGKpwahZxNsvjWoC0Il9qI?=
 =?us-ascii?Q?8SMKgw76lbckvyfCCJGFXZkrxKdlwu4tOdA+MflGkGDzOaZqARv1Ve3cnUyY?=
 =?us-ascii?Q?JJACArpMg1ONbmQZEXkEcL18i9KfwRpQ1mPtoUaQbgEOYoZ5MErMsym+ZqyV?=
 =?us-ascii?Q?FmtjGcv67u/UfijC+BsG/3OcHik5R9oxE3pTWftgph8VTXOm0BYBK5T+4wTe?=
 =?us-ascii?Q?Q5Sv4BmTzZq0HDUzPe6LcH7oqLNxnNTxiAZISGnt8hod9TxFSZoGb5Nb13xo?=
 =?us-ascii?Q?V540wv2MgGjyGclt4aotZV+GBnRQc+uZCNRxwzaKjNY1xWFjSW8sMW+/yTvj?=
 =?us-ascii?Q?/nWOqBbqTAf3UplAc3IQrQUeUOfeWdcD2E4BHUJyjviODobNRDMH+H53EOps?=
 =?us-ascii?Q?G3K8jif0ge1joevO/FcESAVafIkuf8enox4Q6fHD1KEWxR1KXe3WMKwqKyGV?=
 =?us-ascii?Q?R6dbI0j4UXdBsLLnRrIOsPigWu9m2ZXgWhyHpHErtE80XHH+Gg4sGMor9Vvi?=
 =?us-ascii?Q?dO/mN8mwlhXZfsU/VE2us9U+24rrnL21cS+xaGJElBYegm0zpJUUlW7kpbJ6?=
 =?us-ascii?Q?qFFp1W+F24W1Zh44h4Bj9TS0w1/aA46DyA0/7p0NKcFinZAdSbdfgHpIJku9?=
 =?us-ascii?Q?SaPVp52Jn7r1nKnX8FfpilHZkZztsn8XHEIXVRxyqP0NfCnB1+Pg+OBlvNTh?=
 =?us-ascii?Q?VuNAMehDHq0/wv2TDj6r4xyql7jKrCdkpdZvXFlvFb08nYbE9kQ461ShEN4w?=
 =?us-ascii?Q?U85sdznOuIKBB/048CrFbBc7RJZBoYZr/m0u6ggGmZMQiKn7ZTTMlJ6Rl6bN?=
 =?us-ascii?Q?wseY03pqNgMVR9LnGQd2KxNkYuueoIA8BH6hd1KKXlQSSaBc7re58ziGxqic?=
 =?us-ascii?Q?7iwHBG4zQfkCcG08TPZWykgfQhE734R8bZCKvi0uVcXrDA+Zxnn0kFncp7UH?=
 =?us-ascii?Q?Feq4rYQu62gDY7nmmB8HBBz08sIEpC4fiVtjb44dSfi8EZKS2aPP3V14NJ9U?=
 =?us-ascii?Q?H6OyCzLrWEA1JBUOiJWH/qcTfrhmEQYJ8IO2+wtxR5uBx1AZ7z9Iktp5ezQG?=
 =?us-ascii?Q?ZRx+54wJc2MgzYbovgQQqHj9JtakCj9/ldczWWuTSSNisjwxIFjzd9UG9wic?=
 =?us-ascii?Q?VEWgnYuct4VAau18JQFdzpbDvkAMpNIUhWGgx+LuGtUN1njMoiaRVMaaDBXt?=
 =?us-ascii?Q?eafOhnvtajqsCzy4uzM29Yn97qzvHSPm4rqlp3hqNZyruU+wRyW4WVVsl4Q0?=
 =?us-ascii?Q?2crDpCyyJZfookM98w2wBrRt8i4odBskP10/+s9fgLjDIJX52kvjDPsL1d8Q?=
 =?us-ascii?Q?V0SNIffNquglL7lR9gEcpz5DzkJ4Vellq55svUE0Wx2GI82Ec6k0+Ig5s95K?=
 =?us-ascii?Q?AcJZQ1AmdztjPCVoU5mwp/lpaqdDj1v2wmSjDohA15Z6GVX/4jnlOVc1VIFX?=
 =?us-ascii?Q?vwFGDRTmZgc/8biASLHnT8jta0DmITGhXuyCzRP50Pvr4wRX4fkpDIl3331k?=
 =?us-ascii?Q?/pxQFm9TuDmeCVbPLSbZR1ccgdpZze4tyvsrSfKOq3LJLLQyDGQqBxQ1h35r?=
 =?us-ascii?Q?NMn1/+ju5GlRm2+AELae1fI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47b7ea07-4871-445c-9cb8-08ddb9ed52a0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 04:51:50.2204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e2WflkLuzAot0Ik9JsJm4bE+7R6vPog4lKuOgE/uSjtGpvPAmGLZoBd7pCwxdecFNzpzEqA1jIo0rQwePHbnBcuaSJzNwxPFPFnWV8pOgS3pGtRLAQb8uU4atLYyCk02
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8499

From: Nghia Nguyen <nghia.nguyen.jg@renesas.com>

R-Car X5H (R8A78000) SoC has the R-Car Gen5 compatible SCIF and
HSCIF ports, so document the SoC specific bindings.

[Kuninori: tidyup for upstreaming]

Signed-off-by: Nghia Nguyen <nghia.nguyen.jg@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../devicetree/bindings/serial/renesas,hscif.yaml          | 7 +++++++
 Documentation/devicetree/bindings/serial/renesas,scif.yaml | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/renesas,hscif.yaml b/Documentation/devicetree/bindings/serial/renesas,hscif.yaml
index 9480ed30915c..4b3f98a46cd9 100644
--- a/Documentation/devicetree/bindings/serial/renesas,hscif.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,hscif.yaml
@@ -63,6 +63,12 @@ properties:
           - const: renesas,rcar-gen4-hscif # R-Car Gen4
           - const: renesas,hscif           # generic HSCIF compatible UART
 
+      - items:
+          - enum:
+              - renesas,hscif-r8a78000     # R-Car X5H
+          - const: renesas,rcar-gen5-hscif # R-Car Gen5
+          - const: renesas,hscif           # generic HSCIF compatible UART
+
   reg:
     maxItems: 1
 
@@ -120,6 +126,7 @@ if:
           - renesas,rcar-gen2-hscif
           - renesas,rcar-gen3-hscif
           - renesas,rcar-gen4-hscif
+          - renesas,rcar-gen5-hscif
 then:
   required:
     - resets
diff --git a/Documentation/devicetree/bindings/serial/renesas,scif.yaml b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
index 8e82999e6acb..4560e06c6e68 100644
--- a/Documentation/devicetree/bindings/serial/renesas,scif.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
@@ -70,6 +70,12 @@ properties:
           - const: renesas,rcar-gen4-scif # R-Car Gen4
           - const: renesas,scif           # generic SCIF compatible UART
 
+      - items:
+          - enum:
+              - renesas,scif-r8a78000     # R-Car X5H
+          - const: renesas,rcar-gen5-scif # R-Car Gen5
+          - const: renesas,scif           # generic SCIF compatible UART
+
       - items:
           - enum:
               - renesas,scif-r9a07g044      # RZ/G2{L,LC}
@@ -174,6 +180,7 @@ allOf:
               - renesas,rcar-gen2-scif
               - renesas,rcar-gen3-scif
               - renesas,rcar-gen4-scif
+              - renesas,rcar-gen5-scif
               - renesas,scif-r9a07g044
               - renesas,scif-r9a09g057
     then:
-- 
2.43.0


