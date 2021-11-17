Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 975214545DA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Nov 2021 12:43:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235061AbhKQLqZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 17 Nov 2021 06:46:25 -0500
Received: from mail-os0jpn01on2105.outbound.protection.outlook.com ([40.107.113.105]:30596
        "EHLO JPN01-OS0-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231907AbhKQLqZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Nov 2021 06:46:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RWRXfOBb8YIBdlLPcy7lqqeSJ3Pa/nAAZFx+mxL5EKOk2BxEDa6mCFTqULK54L8LaZyHXoWHLHkmoJpoHCg3nrczDzakUQPDsZZMCneJQiku8u1Y90HigAlSUMGXX9iio45mAB8iSh4fMtmdE8lf8C2ziD7TZlKi1bfwkvmNWQGu0yeWtusxLqNMF0+xwML4j8jsU3JWBg4cv931xOr9ypiQwJJufw84pvo/JZesfh3UsLkJkYTJyRFqx+qcu/3Z1xO2VCw40lzcukGEimppRzfW2VEzKGy3X3+Ar3E8XFNSghsUtHLSsMoBypGqLInmkk4yqG+mu+9BqqDf8N+ELg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Oc4yBzwKd5d5EGDrT4mSs/aqni1p7o9Zmu7EPLNyIk=;
 b=hutvAYeADgLSw4AlNc2r2RvP1KPwxH3yqpPulN8goQWtzOz2aYBaX4jBxz7PRFGK/PNwEeXdkXAUk7Lrvy/dlWSplGhTUB7gFYE/c4RlsF2CQI9kBoZMkkTRUb2FiLVoQ5ZZTgxNPZPMngvc02ogtC3WY2wHkagzdIKiiay62WwCiaSFPC1UBdcJJQAFoy0QieY0OomW7BlnYSiyD1DWRjs/1JTLVWwrWjU0pvktc7osCm2nNCkkZQDtfN4VA5V9/mJrzwGohPkqt8eGebh5cMtKd6KcWQeQpW/bgKoy5Hnd/DgSD2rJV5H1rujRSZpuR3WgrxpbFW/s2j75GKrPyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Oc4yBzwKd5d5EGDrT4mSs/aqni1p7o9Zmu7EPLNyIk=;
 b=XgfysuaGhakta5iVvw6JbzFL2rWtr1ocRroyudXE0bAZUg6P3U1K8aFwXGWJUqKaY5Ld/jkEXJtzsu00a/NLJ2tzoRmxVJPNHITvHtXvLX3WAS4jYfFUdULOFCB7tPxXqXhJ3taF8VFmGYlj9Xs6jp4Be1/d/gzF4iLy09qL3mc=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB1703.jpnprd01.prod.outlook.com (2603:1096:603:7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Wed, 17 Nov
 2021 11:43:23 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%8]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 11:43:23 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: RE: [PATCH v3] dt-bindings: mmc: renesas,sdhi: add optional SDnH
 clock
Thread-Topic: [PATCH v3] dt-bindings: mmc: renesas,sdhi: add optional SDnH
 clock
Thread-Index: AQHX2jrE4eSX7ohpXUa1PkZIvz7h+6wEx4EwgAAw7wCAAA+tYIAA7DUAgAABScCAADAKAIAALcywgAA6idCAAPoDgIAAC1/A
Date:   Wed, 17 Nov 2021 11:43:23 +0000
Message-ID: <OS0PR01MB592262B417B92DDB0D1678E7869A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211115160600.4455-1-wsa+renesas@sang-engineering.com>
 <OS0PR01MB59220D97CD59F44918DE4FA586989@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <YZKz/ptgPfzqGfeq@kunai>
 <OS0PR01MB592241C04F5CDDB94D850FFA86989@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdUm2EG3Yi+eTZA0E9tZOT71ewkbx=yh8sVOnL207Od3Rw@mail.gmail.com>
 <OS0PR01MB5922A978B55C09B9E754DBD486999@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdWVB_7U0R5hkO7eEkzdkmhwCEFstskvXJgO-dU1hog=+A@mail.gmail.com>
 <OS0PR01MB59220069B3113A206F31305286999@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592210D033924785A1C33A3386999@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <YZTZ6U/z+pQd5gGx@ninjato>
In-Reply-To: <YZTZ6U/z+pQd5gGx@ninjato>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0afb5055-e3ef-482c-0791-08d9a9bf7623
x-ms-traffictypediagnostic: OSBPR01MB1703:
x-microsoft-antispam-prvs: <OSBPR01MB1703288B4CFC7B3C55C56DFC869A9@OSBPR01MB1703.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gZwtUGdA8CgoN416QjLsjyt3zRL4Y/J8dRJ2k4lE3q2tCaiFDeYpaSSuM+vqNSbj/qK03OILEE7uegY4zGVWcfeRjC+n514CCQE1TGClv6HUNZL78B8bUDirfT/zd3qApDVzIUVp+8XlCgaHH8unGq+ZaXoEDzeOLc/AM1CmAXBESoelGtwFMM7pr6vQatpEXwAelQOY7Dp/ly6R+KLtUhGEM1ewUo04mhp3s80ibUjlrOPt1c6DxTcIhimrd+VUiMhpgQbfNqchOYIwTU8JP8w7SZkkqu3GFTP8jk6M40BHnbuQpLD4IJVSQ93a5aCqSNuKi8qz2tgkxCmK+K2ue2PT8z6KQXgn7zYWLXlfTYDVhtT9bZaWR6meD5vgSerBB6dzz0WP+d93vQvv8X9Nl6/w98VoXTX82EknvGguwhWbtBTX6h481tYPlQFvO4eabvzWHT7ZLKDzNTk7SKl14ntuJ9FA5vy4+uC503PLHrsjYV9N4LJH27zPRMlv/UHs4Gdea65hB0/dCzRDG7zJ/VKO+bQidm79iDEpP09vw+9g/YH5bvEBxrKOv5GwPLk8qY63iv9DRYzsFNyGFkwxL5Pu3BQDUiyEetJqhOsVeSrMbF4pDLaOfLO3dbxD+QzbiUIX7trOVz+DJodYcNnFpanQb49HxbHX2XPsPXsU1xw9Zuqi+pioJ5BKuzfi81meOxzVgbm7h6Q8P27pXyG41Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(64756008)(33656002)(66946007)(66556008)(66446008)(38100700002)(4326008)(8936002)(54906003)(76116006)(66476007)(52536014)(508600001)(6506007)(26005)(316002)(122000001)(83380400001)(38070700005)(186003)(2906002)(7696005)(5660300002)(55016002)(8676002)(86362001)(9686003)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EWlHd7r05vaDm1woX23bOcd9jXejZs7BOnpyfCVsdtwJwVpzY2KYosLPYT24?=
 =?us-ascii?Q?agDDIz6Y9Lu9tuZ80iYbT12tfXeFhbvYbwImalHM1nopXVoPkYw5ruUVVg3n?=
 =?us-ascii?Q?zq27GwwIFang2rdviJ1pguM3HYU3p9UDPd8GGfxIkBLGoVdLJeFKZJ8sHFNM?=
 =?us-ascii?Q?9VcGn3FO0klUyA4zShWln7q0+K5q21hH3NYzhHV/cRwnoWe3C1317Xx+jZKA?=
 =?us-ascii?Q?XNm9AAGa+hPkGxnvqQ2WsCPGWBM6Byx8B/ALZuGhut6krMuLBT5qFzbK7MMy?=
 =?us-ascii?Q?M3R41VQxpUGzwo4DTAuRFdsMLs+Z5BIYAE0UN2NMdZOfa7xo8pOJTp/R0BPo?=
 =?us-ascii?Q?Pr3UxfOc8Xr0J+aTtC2rzVVQRAAJRm2Sf0lh0EoRVfTxznPqMz3/vx0REYwd?=
 =?us-ascii?Q?bMDMEGL7qHwKn3k22JfS0wM1JhFPIXq2kLGFerBiLxK2e8nn7q9IDwfSlClS?=
 =?us-ascii?Q?sRF5mjZ6oPopkg9WdOAC6GawJg/HoZ8cI04SNtovZmnb2nm7ApkkjFmRW8GM?=
 =?us-ascii?Q?pFzttlz5E9vbbcsvtgfHix8Z712OqwGh4imIRLExpi/nrdjC44PBdvXWZqmI?=
 =?us-ascii?Q?thipCEgrRRMf3VcqK6YmYMsIDIgP9WsjzY5P+MkwoJniO1cWCEHYhvIb/qST?=
 =?us-ascii?Q?Zk1Qso1U6pk3G5S0h41iXQi/8smOCFvYpVJK5XFjHzKc5vnvqzigCgB2iUVY?=
 =?us-ascii?Q?MkuPwTYS18XFFHTDDJDXiL89hBcra8+YPb5PXmizF4dfRJhEa0sWhovJbJD3?=
 =?us-ascii?Q?xEdJFnXUoy6j9sU5+ReJEMqoWdmlxITbD0ZnD5vn4K7p6qnoIdiMzTPrNYLy?=
 =?us-ascii?Q?mopq2rWVzPZp5X52fBv6aZ3FktE5jV9KJU4QCzqNatKhAj5eP8cTr6sbdIYl?=
 =?us-ascii?Q?8mzpOcdwPTzFxsjdUuksz2in8AGQl2dSDozEG2sa8DAtBQCsxyOkarYVRlje?=
 =?us-ascii?Q?WlzrKKK5z6j0ihQZqiojfqcUbPvNkQPaeyFXh0OoPOWYadNf1xzApJ7A8xaY?=
 =?us-ascii?Q?AGdpLWIgYJ+xmrGa0FYPOjvIakGn1jO11ophvb5VIDmiXeKr+F9fcDJBmbqK?=
 =?us-ascii?Q?TyD9LQTF7LQGlESUYLDcZvA0u/qu3PyTWAQz1qftev2u+V2tSJ9KpxxNXHEB?=
 =?us-ascii?Q?uGMv92ssiCDFvge9iMNt3ZFkAr46PCzH3D30E7Gc4Up0NeLNsYkUEr3HkRMI?=
 =?us-ascii?Q?NTgvq4G3nxjEJ9tpUhNRt/dYcI8CZidRJXIxNZD+ctxKBCOEh+tLHivOw1i4?=
 =?us-ascii?Q?/Xt4udqa2ypvqp1w6OhWVxJtiXlojnk7FpsN5XWjX+yXdR+laja2/HYQd6ou?=
 =?us-ascii?Q?Xqn6kyUP4N8tI0sXsr3rGQ6ifEsUrezANZaMSB1MAFWY1kcJcXL8IzPNKnIC?=
 =?us-ascii?Q?ghSVg12HhhK0O760VRMKTljnZKdpuF0xewUrrIJNOGoucFmL8rWQsJn5Aed4?=
 =?us-ascii?Q?AxhiNLHcV/MGs2JLYekrqAkUVQgh/BdAIF6FGq60Vysy1RQ4FXe8NzKgIYyW?=
 =?us-ascii?Q?s9dfct3NMgy9bbyJYlZUkN2cpORvF5mLCoBLiZhI7MGchwoXoVj0xtaw7Wkm?=
 =?us-ascii?Q?nJUhHqeihg6PsiLuk2GifO7OKcGulkPtvs6lgEdebVrCuRBpB6VWV0fnGa/g?=
 =?us-ascii?Q?a8H79d71g5SPowoBVBAEl9Dc8gim1n65iS7aGkcPrsL0hJNMinROCiwWYNZa?=
 =?us-ascii?Q?SrWBeA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0afb5055-e3ef-482c-0791-08d9a9bf7623
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2021 11:43:23.3768
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iisAZbIqo2rjcbUVzUkOn/hLb7x4mT0xrju3xpGc+zYZZo61VbFC/z83fmNDuej+8XfuW0/+Q2phmxvcYg8X2+bPBkcMCPPc9Y+ZkZA+2MA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1703
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

> Subject: Re: [PATCH v3] dt-bindings: mmc: renesas,sdhi: add optional SDnH
> clock
>=20
>=20
> > Please let me know, if you want me to do this changes as separate
> > patch(binding + dtsi) or Will you take care this? Both are ok to me.
>=20
> This patch is then good as-is with Biju sending the incremental patches?
> Or did I miss something from this discussion?

Just a question, Can we make max clocks to 4 for generic compatible?

Then the patch will be like this.

diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Docu=
mentation/devicetree/bindings/mmc/renesas,sdhi.yaml
index 43fc6ac56038..6a9d58b33ef5 100644
--- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
+++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
@@ -103,6 +103,39 @@ properties:
 allOf:
   - $ref: "mmc-controller.yaml"
=20
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,rcar-gen2-sdhi
+              - renesas,rcar-gen3-sdhi
+    then:
+      properties:
+        clocks:
+          minItems: 1
+          maxItems: 4
+        clock-names:
+          minItems: 1
+          maxItems: 4
+          uniqueItems: true
+          items:
+            - const: core
+            - enum: [ clkh, cd ]
+            - const: cd
+            - const: aclk
+    else:
+      properties:
+        clocks:
+          minItems: 1
+          maxItems: 2
+        clock-names:
+          minItems: 1
+          maxItems: 2
+          items:
+            - const: core
+            - const: cd
+
   - if:
       properties:
         compatible:
@@ -113,53 +146,21 @@ allOf:
         clocks:
           items:
             - description: IMCLK, SDHI channel main clock1.
+            - description: CLK_HS, SDHI channel High speed clock which ope=
rates
+                           4 times that of SDHI channel main clock1.
             - description: IMCLK2, SDHI channel main clock2. When this clo=
ck is
                            turned off, external SD card detection cannot b=
e
                            detected.
-            - description: CLK_HS, SDHI channel High speed clock which ope=
rates
-                           4 times that of SDHI channel main clock1.
             - description: ACLK, SDHI channel bus clock.
         clock-names:
           items:
-            - const: imclk
-            - const: imclk2
-            - const: clk_hs
+            - const: core
+            - const: clkh
+            - const: cd
             - const: aclk
       required:
         - clock-names
         - resets
-    else:
-      if:
-        properties:
-          compatible:
-            contains:
-              enum:
-                - renesas,rcar-gen2-sdhi
-                - renesas,rcar-gen3-sdhi
-      then:
-        properties:
-          clocks:
-            minItems: 1
-            maxItems: 3
-          clock-names:
-            minItems: 1
-            maxItems: 3
-            uniqueItems: true
-            items:
-              - const: core
-              - enum: [ clkh, cd ]
-              - const: cd
-      else:
-        properties:
-          clocks:
-            minItems: 1
-            maxItems: 2
-          clock-names:
-            minItems: 1
-            maxItems: 2
-            items:
-              - const: core
-              - const: cd

