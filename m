Return-Path: <linux-renesas-soc+bounces-16973-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2168AB35D7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 13:22:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 320ED1897CF6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 11:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5352F1885B8;
	Mon, 12 May 2025 11:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Cf5X0Epn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011039.outbound.protection.outlook.com [52.101.125.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E267291874
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 May 2025 11:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747048934; cv=fail; b=ANjEITI8lCkOivvPzoajkJ37E/H+L0FSKjp+kbIn/WYYazK7mTxeV3h/1KOJHOEYS9aYJQJ1SRtUuiUkNDeVczU4IUbDoo+NfUgrm6u7fhrtfE9uEsmuKiNstauhiYhF/ASTMvR+gt5knea/N9iNrxAkcLAdLt3QZppVN9zRB9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747048934; c=relaxed/simple;
	bh=CgaHtU4bwU5iGLMwUjX002O2Q8AKRxUL/T/21C39Di4=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CiVdBl4B0aE/TD6XGbV1YguwLdEERTHEpuyk4OtFFsuGwfox6XbWo8V0oZ1FC41/JZbwWDytR9TOe4uA7rPj2mf76UoFoCRV5uOrQN4ox3ohXpdXLX9jWfB5k5V1REwQ0Q/SS68MpWigZyR6+r40KmMJcXgMisEk8dS1k6zz4Rc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Cf5X0Epn; arc=fail smtp.client-ip=52.101.125.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vZauKOw7dz+BpqrnJZ8gvFk8PRLOVeFD/p4+3rUgXGhhXLUlRGX4DyraALdm9+YlLvSqj3U1Rnwy4CWSO7wRk3ZhtFr4MLWiZtmsv8EHyTFGRTRdU+CKVkXlKv1mpfEXFfutII5UK0mWmgL4JLi1qHA9mVnMi0wd8HVmo3xJOBRPj6us1b5JGVuFCESqvPSX/ys5F1SFGzbFy/gQ8nc9DfRxkBrX7gp72dmKFG9O/LI5v+sJxXsbkSicVqdrvut23YJbNCXQVDyoTURP3dRo/NcpIn+NVPA13keBYOyZvxG29TNzSDprTMiS0cWjHOcEN+/iIGMJumLQA/fymRnCnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EYo3+UJx8UZAsQlDHiKbUEwWPj6ynY3TZ+qzQSbPCw4=;
 b=CG2F5Xo90Jg8nw3O9Fm3aLjDZ2uWBCc+M9G/1H+bvtsgv6Q9c18Lf/o6cB2QtWmObdmfLYcIoI5qcreorEGu1C9TzaVHirFHLv/Vxff+mqO7QW6QwLhZYwDdt74ZBeJbg3/4+kr/yUDAAJAWRu9km+Ssutxnv9G/US1p27niNghb5dvAekSIOTBnYMK6Uzvxued120lSxodQFO4h8ToJm3mNKe+R952CyiYfNwh4vNG4WhpVPKr0aURwSXfa7BmoUirVoZXWNJLpXX/vgPsF/TRDsR487lw1dpLua2cc+F/XAkVmRbeOufVrqn5zdoKmkFmYIZgC9vkZ0VGmrUfTbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EYo3+UJx8UZAsQlDHiKbUEwWPj6ynY3TZ+qzQSbPCw4=;
 b=Cf5X0EpnjmGQKecHzs4AWY0dudFuhscWcZMDd3nVEpmxE5XhTh88eGOXTHONacHwC6LMp/2owEqeY5aGZro924690cEQUpt8OWn3U2JJZRGarlONJhdbmUxi5TaMrn+KFs76nlWFZg4Sp2jeCmS5TwN5xG1hpUz/Wd8Y+xXk48E=
Received: from TYRPR01MB14284.jpnprd01.prod.outlook.com (2603:1096:405:21b::6)
 by TY4PR01MB14719.jpnprd01.prod.outlook.com (2603:1096:405:25a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 11:22:08 +0000
Received: from TYRPR01MB14284.jpnprd01.prod.outlook.com
 ([fe80::dc7c:6361:a82a:933a]) by TYRPR01MB14284.jpnprd01.prod.outlook.com
 ([fe80::dc7c:6361:a82a:933a%6]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 11:22:05 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 8/9] Doc: devicetree: phy: renesas: add compatible for X5H
Thread-Topic: [PATCH 8/9] Doc: devicetree: phy: renesas: add compatible for
 X5H
Thread-Index: AdvA2oQJ2f2yTr6ZQJ+h6L7AIgxJZwAB16YAAJN5mRA=
Date: Mon, 12 May 2025 11:22:04 +0000
Message-ID:
 <TYRPR01MB14284C4BAEAA1B29E643E54638297A@TYRPR01MB14284.jpnprd01.prod.outlook.com>
References:
 <TYRPR01MB14284F48E79FF2EC68133F5B4828AA@TYRPR01MB14284.jpnprd01.prod.outlook.com>
 <543a8893-488a-41cb-a1e3-c7f5fd3894bb@kernel.org>
In-Reply-To: <543a8893-488a-41cb-a1e3-c7f5fd3894bb@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRPR01MB14284:EE_|TY4PR01MB14719:EE_
x-ms-office365-filtering-correlation-id: 01cf1ac6-7d7b-438a-cef1-08dd91473983
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?OICYx2inngyddKoMfm1P12MATeNX3RiWxqqFE0LF8ly5ziH2zsinqEEbF/zS?=
 =?us-ascii?Q?oMoEhTS43qJY/3kQvm6+ZXeCGxr+mW44x4IaY3vqJ7eKOi56yBU7o/VX+lYh?=
 =?us-ascii?Q?fQPC9GxLVoDpAVovkrjTsiviaNVO557jia3Llws3WzRCnZ4IuP7roZJgzsx2?=
 =?us-ascii?Q?7exu4pFJwKUtdFMX2y+AfzuaaAybYrLxkW28AQ094PvN6NJSA/UghIy/JNUo?=
 =?us-ascii?Q?jcmOUi4FJqlMj3MXtCFMu9xxXCV4ez2ubaPMiOO7uMUBmyJ2mutnzrZGjdMO?=
 =?us-ascii?Q?QKfCQBmlylvgUbl07Pw+7xTCJus+V0nYrtudThZj04pKhu1kbiuvnANyBodb?=
 =?us-ascii?Q?Wg9YU6eaggjBhW/9yAPAjgAFQQ5xD/vRcKftiiWktfKxq12HlCGYLefWjKMM?=
 =?us-ascii?Q?v88UPUcjs90uiAq05nnQPaesPij299F4SG481KAe1TdqMzgn4O3JFYQXinvT?=
 =?us-ascii?Q?bmnHCr4RLKVjlmJ1YhzlxSA2x5QDEGYcLGg3UEcWn/OrOS2ondGreJ2S5jOY?=
 =?us-ascii?Q?pC4oiLZEJeAjomdX7W7Mw9Vo77mkrP4jNV2PrVc9mEfWYHomV53swkvBsasK?=
 =?us-ascii?Q?wcTOuTiuPUTNbQM/wJcIDQGfJXYGKKUpSaJtvkv6+jGO1bSnZqcD4r85kecM?=
 =?us-ascii?Q?r4ghHLIJfo7bTfI3IRes0jnkS68BW2pKdvHA14BT+On8FRBjeKQWHbIimwq+?=
 =?us-ascii?Q?rjNiD1j9ezTtBlDYi6nn1bPsd900G4+xPzGwh22GEzjBIuEkkk6NOz/JuX2v?=
 =?us-ascii?Q?BilVrumIE0vjgrWq1SRUKDJoneKlh1XhBA/z6sjHpHNUbN/FPkUYSaToqhU7?=
 =?us-ascii?Q?QlyBv5CZCb+2vKr57O3ZsoPiY+rRzODyCAc8HlmQNogZpY+4rdC1Fh+LoRoW?=
 =?us-ascii?Q?UbVO0TfZ/UBHzYuJDuoYmjkm+gIOTX6w12sk4yzhNhM5i5r5w2z1rbbuqPrM?=
 =?us-ascii?Q?SmodOGi8cRUQHbM3dKoJquZDBMHMD0bgTB84yC7TANvGX8pN83Gg2T405QHb?=
 =?us-ascii?Q?78p8pchlthXzMUckLtd8kNCi1IIZkWbdJi58XNecwYn1t+Ty+ciRlDNyHdKi?=
 =?us-ascii?Q?1tg8VHMVhOn2e4cGErf8IKRKFYUGlmExxMK+3j8fjg9eswRZqSMo+0R/3Jbl?=
 =?us-ascii?Q?OCNNLxwufLx3HK2KDlx6K3Uod+MqAUCXwUXKauSXBh+TTgSBn8x4jg5fN9od?=
 =?us-ascii?Q?gOCqpfMPWYngH7GnHeZkZAvKNa8qCy5zycy2DmkcZUOIWVpnzI4EuwKpomEj?=
 =?us-ascii?Q?B+wXW64gyGiFjBKI1rc/2x3EpXcTzij5bPOb1AAVdweOFOA3IfDZ7qGESUEb?=
 =?us-ascii?Q?/c0PkFqWtQvGZ4lHlTomJKnTklOBOjQCMOd4LxQw53PMDY+bZPZqE16lBuFm?=
 =?us-ascii?Q?DoEP1NdJ4U4JJ1KqG5pMQrfeiucDlPLzRbLeXXt6koS3BlSbREiZkd83p2s/?=
 =?us-ascii?Q?Ulr30uQMmro=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB14284.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?mm+kHtmFQ5YoeGJvMyjaJLWrnAhay3JakHQuKdME+VPIqJM9x2m5RuLQyiwD?=
 =?us-ascii?Q?k6n1/UccpdKxhjH7qO5qZ2J/0b4PZmK7sR03u2ujHS/VQZptWmd45k/wn5Ge?=
 =?us-ascii?Q?wwNqHx7OAfKB1yNzC3cxhNmTFxbpJaCn+x1OP9TXMKKhFrJUcMQ4fUoAHv+6?=
 =?us-ascii?Q?tg7fuCIy4+rH1PF7lIjR/1If4AMlmFIm4mgZKYcYsnVgO8KpyytJpvkGkTGi?=
 =?us-ascii?Q?rdH9WIq4dwBmW50ckMfPl4NME4X+1C/g8IkZqgb9mVHCnVBljWuFH2+O4Odr?=
 =?us-ascii?Q?zrxJ/lxhF92Gv0s0UVCR1qgw2rjjVgkihW+KE9k0IdymPOPjA+GAjrI46ZwQ?=
 =?us-ascii?Q?Z/qKE+1SmLX5Hsb1i/g8L/Kgl2sBwurvcb2/r9BRx0S3CQNGRTtfqJGwNHHE?=
 =?us-ascii?Q?0zN7/4PVgwLzrk+/ZunwBKAZTsQrR8kIAFnA2j0ac5ZS1PI2cboX413WQSyd?=
 =?us-ascii?Q?rPyMoFTxf5xiaCSPjSZVYjuUhemnYZJZeW5Fb/K35+IgJj21Nymr+hPd3FhS?=
 =?us-ascii?Q?C7XCEaT40OGdWH86MKiGaGznPYu5+7GmOdTcdbD8hLLrr3USiE+Bx2AbncaE?=
 =?us-ascii?Q?9gctXxr9OhMoQ/9bPPh8qS3JYzMWaJEWuH95yrVtHBn9kGCoUNRDtIPkokvc?=
 =?us-ascii?Q?fCP8bkniF43f2nls6nbxf07+M/2vVWXZH0M5Hrjej4uxnaZnCEgPL3J5dMBB?=
 =?us-ascii?Q?+iOiwTQXpgrIKJn9C5YH1xD1E7DIZoirFy/zN5KJKupEViJk5TwE71C2Smqh?=
 =?us-ascii?Q?qJ5nfrugUofEBpeDClY583mdws6h2M8dvxugqb/TuoWUH0H9gvWJmMHLrUef?=
 =?us-ascii?Q?KRVSW0Kxs1/Vu3wQ4iW7FLqFmaxaasW0qr0nCGTcBR5KuULJS5FEswAB9e1M?=
 =?us-ascii?Q?5RTHC6yI1Bo7DMR9dkG9Dg5UobgkfbG74LufuHoQssCa8qPE23ExBJhvqwQP?=
 =?us-ascii?Q?drTIoUN7mrBhZWoORkw1QMt2P7ikcmqwL6MKm9/+Ol89h3F6hPASvFwgu3TQ?=
 =?us-ascii?Q?CceNBesHMy2/goErKalHyyCrUt7FJGL169LuI6oMA6fWG/8SlimKiano8SJv?=
 =?us-ascii?Q?6981tNqXgKEDxIx2m3VTjG6ck3sac/qOCGLvAbrrmGNJ8nmi6koPVmpm7Vdb?=
 =?us-ascii?Q?qq6BNKuGnQxYnLbYyRABx/n3IzH2kQACUOXDVBc8lC3gL9xpPvKuDpUDamIq?=
 =?us-ascii?Q?4xBKUG+WIzpvfO5JWESt1HI4VbeU0CYl6ZDwLWg2O6WJOMjksC5BXArOKycX?=
 =?us-ascii?Q?E/T6wSC64QOEufjDSnfRKkJVyyKAr5MOh9GaaLpQXNNM80m5Y59VK2NGNjAk?=
 =?us-ascii?Q?gwOs76HP1uV10V7rEk4MTBdE4Ky7i3D/VHL1ihu60ijKg7naSjcwXqElf3KQ?=
 =?us-ascii?Q?xsi5eKx1popQsMI9G0DEGnO1+Ub/UbOfrNJkWcCBWyh2eEwc8JKNsoo5kkAD?=
 =?us-ascii?Q?nyX1frUNabEs+FB4TjkIe6S4F0NGaCJr1SJRDcoHH0fJy3bWmzOa5G98NPSH?=
 =?us-ascii?Q?Eb2IA/3f0pUlqQKGeouqvuod4hc7xtac3GEbEnhm22Kp4Sj6PaSGz+hgDxAC?=
 =?us-ascii?Q?fLDoYQ23bq3UR4bD8EQzJ9DSQ3Z9McEkzBknIj1s?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB14284.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01cf1ac6-7d7b-438a-cef1-08dd91473983
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2025 11:22:04.9612
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zE3UXz4Zu4RkqQVzj+tKxx1cNVKIvY76ms9j3ZeAsmLgQIEJTddnRRUv7GVsJJu8UlsXtarsuMW6JRGd1ybJxxFtAcUV8ZOwNWab1jibf/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14719

Hello Krzysztof,

Thank you for reviewing and commenting on my patches. I will learn and impr=
ove my workflow.

BR,

Michael

-----Original Message-----
From: Krzysztof Kozlowski <krzk@kernel.org>
Sent: Friday, May 9, 2025 2:57 PM
To: Michael Dege <michael.dege@renesas.com>; Yoshihiro Shimoda <yoshihiro.s=
himoda.uh@renesas.com>; linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 8/9] Doc: devicetree: phy: renesas: add compatible for =
X5H

On 09/05/2025 14:04, Michael Dege wrote:
> From a2f88121b79cdf756dacc9d58ed1ca23ab1c8744 Mon Sep 17 00:00:00 2001
> From: Michael Dege <michael.dege@renesas.com>
> Date: Fri, 9 May 2025 12:40:27 +0200
> Subject: [PATCH 8/9] Doc: devicetree: phy: renesas: add compatible for
> X5H


Please run scripts/checkpatch.pl on the patches and fix reported warnings. =
After that, run also 'scripts/checkpatch.pl --strict' on the patches and (p=
robably) fix more warnings. Some warnings can be ignored, especially from -=
-strict run, but the code here looks like it needs a fix. Feel free to get =
in touch if the warning is not clear.

Please use subject prefixes matching the subsystem. You can get them for ex=
ample with `git log --oneline -- DIRECTORY_OR_FILE` on the directory your p=
atch is touching. For bindings, the preferred subjects are explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patch=
es.html#i-for-patch-submitters

<form letter>
Please use scripts/get_maintainers.pl to get a list of necessary people and=
 lists to CC. It might happen, that command when run on an older kernel, gi=
ves you outdated entries. Therefore please be sure you base your patches on=
 recent Linux kernel.

Tools like b4 or scripts/get_maintainer.pl provide you proper list of peopl=
e, so fix your workflow. Tools might also fail if you work on some ancient =
tree (don't, instead use mainline) or work on fork of kernel (don't, instea=
d use mainline). Just use b4 and everything should be fine, although rememb=
er about `b4 prep --auto-to-cc` if you added new patches to the patchset.

You missed at least devicetree list (maybe more), so this won't be tested b=
y automated tooling. Performing review on untested code might be a waste of=
 time.

Please kindly resend and include all necessary To/Cc entries.
</form letter>

>
> Added the compatible string for new Renesas SOC X5H (r8a78000).
>
> Signed-off-by: Michael Dege <michael.dege@renesas.com>
> ---
>  .../devicetree/bindings/phy/renesas,renesas-ether-serdes.yaml    | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git
> a/Documentation/devicetree/bindings/phy/renesas,renesas-ether-serdes.y
> aml
> b/Documentation/devicetree/bindings/phy/renesas,renesas-ether-serdes.y
> aml index 93ab72874228..58e84f703865 100644
> ---
> a/Documentation/devicetree/bindings/phy/renesas,renesas-ether-serdes.y
> aml
> +++ b/Documentation/devicetree/bindings/phy/renesas,renesas-ether-serd
> +++ es.yaml
> @@ -12,6 +12,7 @@ maintainers:
>  properties:
>    compatible:
>      const: renesas,r8a779f0-ether-serdes
> +    const: renesas,r8a78000-ether-serdes


Never tested. Sending untested code with test bypass is not really appropri=
ate.

>
>    reg:
>      maxItems: 1
> --
> 2.34.1
>
> ________________________________
>
> Renesas Electronics Europe GmbH
> Registered Office: Arcadiastrasse 10
> DE-40472 Duesseldorf
> Commercial Registry: Duesseldorf, HRB 3708 Managing Director: Carsten
> Jauch
> VAT-No.: DE 14978647
> Tax-ID-No: 105/5839/1793
>
> Legal Disclaimer: This e-mail communication (and any attachment/s) is con=
fidential and contains proprietary information, some or all of which may be=
 legally privileged. It is intended solely for the use of the individual or=
 entity to which it is addressed. Access to this email by anyone else is un=
authorized. If you are not the intended recipient, any disclosure, copying,=
 distribution or any action taken or omitted to be taken in reliance on it,=
 is prohibited and may be unlawful.


For obvious reasons we cannot take proprietary code, sorry.

Maybe I am the intended recipient of your message, maybe not. I don't want =
to have any legal questions regarding upstream, public collaboration, thus =
probably I should just remove your messages.

Please talk with your IT that such disclaimers in open-source are not desir=
ed (and maybe even harmful).
If you do not understand why, please also see:
https://www.youtube.com/live/fMeH7wqOwXA?si=3DGY7igfbda6vnjXlJ&t=3D835

If you need to go around company SMTP server, then consider using b4
web-relay: https://b4.docs.kernel.org/en/latest/contributor/send.html

Please be informed that by responding to this email you agree that all comm=
unications from you and/or your company is made public. In other words, all=
 messages originating from you and/or your company will be made public.


Best regards,
Krzysztof
________________________________

Renesas Electronics Europe GmbH
Registered Office: Arcadiastrasse 10
DE-40472 Duesseldorf
Commercial Registry: Duesseldorf, HRB 3708
Managing Director: Carsten Jauch
VAT-No.: DE 14978647
Tax-ID-No: 105/5839/1793

Legal Disclaimer: This e-mail communication (and any attachment/s) is confi=
dential and contains proprietary information, some or all of which may be l=
egally privileged. It is intended solely for the use of the individual or e=
ntity to which it is addressed. Access to this email by anyone else is unau=
thorized. If you are not the intended recipient, any disclosure, copying, d=
istribution or any action taken or omitted to be taken in reliance on it, i=
s prohibited and may be unlawful.

