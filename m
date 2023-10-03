Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC1627B5F19
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Oct 2023 04:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbjJCCdg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Oct 2023 22:33:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbjJCCdf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Oct 2023 22:33:35 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2107.outbound.protection.outlook.com [40.107.113.107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2DC8BB;
        Mon,  2 Oct 2023 19:33:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UUkl9cppzjItJQ1CwDWMzoGrV7hOqLDTZzTxQ6EbxFnO/qTUhzTMODrRycbT1EQOAALN+G1Z/7AuctcnHFogOf553QSzW6awZdkyvBwe2r9LWelIxiqf4vzFZcO94qCaMgASgtxcphiKPn6/hYufvwhP2xOoFWqFX+sLByTVd4s6cnnaBkmS+yFKsraJJEYgk8oIHvBF79hR+Fi/ZnCSSPDSLjCLBTol1AGr+KYAuqDrUgq0AhsnPT+v8H1Rudw6bwEhyTggO1NXS3lEguEGxsUdD1fv7/BvmX4MCShXTyFVauqHS4ejRfkxZ9/UWUOsbiFj1hy8VrGYvCngvK2/Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9U1m8yLc5fobydDjSum/FmsOg3edGpnAMy7BxuDmLrE=;
 b=j6WqEFyy4nhwni2oF9f9JPF8ZaQ22hvGpfsdEe4JTJQj0EQqiO5SIfjkoKpYBoL1Ued3Fl+bGnjAc/h2e9DEiGohcvuo/M5b8ERKifEApEeCfeROwZklxLOAv7OzQvqzSuRAffC7nL0crzk16Tef+Qbo3asI9WuV7kbhBOeazhBJW2cQHfdQdPlMUg2U3fo+E7+XwcfgYdY8Z9ujdZDs6EJg/zA6VNcPNNO9hbIz8Fgf/JoEP37ySQDgXypnqR2KOnu3Ob0F12RhryUzL503aNjhA5nGGygrPwYSp/5iz/ihNSw1bsc8+9Ge6TtIZMRnMG/YUahDnbEU8usRnq4tng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9U1m8yLc5fobydDjSum/FmsOg3edGpnAMy7BxuDmLrE=;
 b=Pp8VDulYasqTn5IU71jEDWSskV1/a8HNAxEyqXEeADJXuLbIGTtkE15MMGYV/E1PGURNJN2781PZQTgBynZcdP8m+Y2RMcXkcdHpICn3g7DahEGxDkQn5oUsTHRcOgGtoHbP/uVvSW43x1yueVqA1SjFUmhfh8Vky0GjDX+DyVY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYYPR01MB7781.jpnprd01.prod.outlook.com (2603:1096:400:119::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Tue, 3 Oct
 2023 02:33:30 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6838.033; Tue, 3 Oct 2023
 02:33:30 +0000
Message-ID: <87sf6sfn9i.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 2/4] dt-bindings: soc: renesas: renesas.yaml: Add renesas,s4sk compatible
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87v8bofna8.wl-kuninori.morimoto.gx@renesas.com>
References: <87v8bofna8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 3 Oct 2023 02:33:29 +0000
X-ClientProxiedBy: TYCP286CA0138.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYYPR01MB7781:EE_
X-MS-Office365-Filtering-Correlation-Id: 61bb4d37-3d95-48fc-4016-08dbc3b9216a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XIG3hLGH8npd0cYSkDVQ9MSL3fJbSLvZDCvzMQNFIEtv4+rRN2SMpUCHnaqkTUqEdU2vsdfgomJruCmLjXuvgIC1iiBRkerzh0vTM9STAtRovD8iTMbasHhaDsMztQ8+TITH8av8bNEIyIV00GDGOczFqG/kor7mlmgmM2vS++ksrSNlYWyIBBlORjTvpizXpmc9weJA49nP1yOcK0IpTc/vT2/A+2qJnv+xQmo6JBvXntPNREIOcnHQEPync+MgCSBd4L2Quy9NjTG2nbt7lwRs0J4eMedZRbT7uFXHxHX58k6vGH9M8J1ku0OdKcBhOEawNINFXbu9oSaRNLOl3RzlkWDoUTazyRGjY37DmYqY29Jnx8Z/LOfTjb5gHA3I0ixXGLyRYC92HF3g8Z0ldF6V87iboIsBSpC3zHxShzaugD9i4pVHcF6UIqbAqZeGkUnbeSt3JIrKtfXTZDAhi0vPzN2TFFNdBUxv9FAnOvlzYf7i6J5K/gar9tbvA0wOsSltPhZRLbaMhampX4wS1I4q9lFR9bHuL6j5cuUo1EvrCg9znrVLulYBlb3eilp7VB+qqe550HPKisxuLmNOwmgiUHlNT1qNZXE58Xl4Idhf10ZF9ZcEWyyTDva/yrni
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(366004)(136003)(346002)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(6506007)(52116002)(6486002)(478600001)(38350700002)(38100700002)(86362001)(2906002)(41300700001)(2616005)(6512007)(26005)(36756003)(66556008)(66476007)(5660300002)(316002)(66946007)(110136005)(8936002)(8676002)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v42nR65esddrEfG+uioROQ/33l+NylUW4ET3rKSymZNBgLrSDBTPEeD7hrzw?=
 =?us-ascii?Q?VtNjxBzqTDczV+iMs48oRESKKcGoRbVa55SjCVRS9OTK/uYeHQ0eRYxA6PVL?=
 =?us-ascii?Q?oL/uqkz/uizeILbenA2fcnKLLDKkjKxGFDSAT2Phpwu2CO7NWjrQapMkEbNi?=
 =?us-ascii?Q?pHixT9FczopRGqKnHEYQEF484Bz63kJqILl3s/QFTMvYfTfhYU4fO6Zcctrq?=
 =?us-ascii?Q?Rncic639GyiZPdcPVWDDZ3x3DM+ZPrkDuvl9/hZV6PdAu7CUI8ePsN/3rYkW?=
 =?us-ascii?Q?19q1dTTfIatWyvXCL1Jv8imgd+qZdF8Tc7awAiOexJj/MP0btrlNb41ILsHf?=
 =?us-ascii?Q?nbYKK10lej/g+94LodHuOoy9HvbqST2H3U0l9hcE5YecNKkNtF74HisrfiKD?=
 =?us-ascii?Q?mkU9YuoIKG2PO2tGKQgd2SEx0+YVvUgMGMPUOHR2mSy5QuAn7KLZiTTiyzRG?=
 =?us-ascii?Q?mQD66SV8NzghknxaFKMa9nR0GHkAgamYVV9mbtS3cS7Ws07N+d9Npan4KX7F?=
 =?us-ascii?Q?Ji0L08YaHYsS3wwBp7web6xhsCdss6jR7C7y/2gp+iRIosMuGgGWG772cOR7?=
 =?us-ascii?Q?VMimmg/Gt+EMGozf9bpvo4oYIrZZ+2lfkb/TczXcCoMKChWF9rO76vjzr32b?=
 =?us-ascii?Q?B7+0n8TKj2Ko1PBZn3hjP5VyyiSELhgQf0p4SW900E77q4TL61mPzj1Sd6yL?=
 =?us-ascii?Q?ij+BitFWI6eTdl/hwOEQ649ltt9DFh+o39xcFVxyQiFKjalwMT1oJiqwlIbU?=
 =?us-ascii?Q?1UknZRkC84CyrxPSLwH0DYVNUPQMr/0tLCJKGOKruD4oTbjSiCHMJTkbHMyf?=
 =?us-ascii?Q?LoiAPq4IAFQt4m2fONKNcTKYciL67zghM635pOeSx/dNKE1jZ3ntYnOb8yG2?=
 =?us-ascii?Q?ARAQ6qkW5WybqZxFmtyacwnitkqL6GDmD6lBpec9WinQwr8IKlvdV+Byhbbi?=
 =?us-ascii?Q?VR8oxAN8JO4YBCUeCaxVnGk8Y5E7k8GZhhQU3XVOxD9z5bVdIQfMPe9PeBpH?=
 =?us-ascii?Q?MgBxHBGr8I0vpAe5qTEvvfxh8ipAqZucvh4pE85lZAEWyxF1u6DUjSSQBHLl?=
 =?us-ascii?Q?IoDey0J77dYw/EAyIU3/xG+xhCWokD/oZt1dImwNFR0SynMUZYyFTyxK5PVr?=
 =?us-ascii?Q?aNoqPNo8uLxi3kouDxBRax0O0oBX75Q3d4/478dYXaks82mGr5ndKF8nfQIy?=
 =?us-ascii?Q?3JM6vfLIJS1COJ0NX3G/IHixkIFvbp+kAj2n/VttyPlJfq+5a/zfTbDg1O7R?=
 =?us-ascii?Q?Nayw0Q3d/b7eGyQmowJlaaTirs4lPKDy7/cUW/u50xamETyQxZa9Sar1mobC?=
 =?us-ascii?Q?0/0kXTIFyVUQvgAOoVIIihAGiZ3Nax05UgmK1fFIh2vKboBotUJQBG7x8rJp?=
 =?us-ascii?Q?YxCoSJ7fqgh7FvbruMgm/BIwOgH/qt1Nr7zRBpY0EtRhw+k7U6tyCGVenXRf?=
 =?us-ascii?Q?HfT2VMpW9lPeKSjpx+DaYzpkd3eAgQ+47urBB5q7Hqm9NM7DncKDanmSncE2?=
 =?us-ascii?Q?PXVbeOngghxAUBZjvWs5yc/Gt31K99wjV4tcy2VKHWXve6ilBvXSVkdhFM5Y?=
 =?us-ascii?Q?o2PRbpAaC3TxZ5Z1pYdybfc1mCotzUPAaWNXMNlwDUZJ4OzC0B/Pj0tpG4zD?=
 =?us-ascii?Q?2JXFfFyWFpcFekHhbBZGh4I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61bb4d37-3d95-48fc-4016-08dbc3b9216a
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 02:33:30.1092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ma/8EMS9pt0403otm8xtsIyHDDzthBquRjbvZ3bfX0yJPlEYHj9ouvxj1g+SSuShii92Vr/AylGv8fL2wB8pO6Ax74OKdRqcGtLzsXRwdSivEc/BlIbjGiL3WZkBYdro
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7781
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds "renesas,s4sk" which target the R-Car S4 Starter Kit
board.

Signed-off-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index 53b95f348f8e..b2bdc26e8329 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -335,6 +335,13 @@ properties:
           - const: renesas,spider-cpu
           - const: renesas,r8a779f0
 
+      - description: R-Car S4-8 (R8A779F4)
+        items:
+          - enum:
+              - renesas,s4sk       # R-Car S4 Starter Kit board (Y-ASK-RCAR-S4-1000BASE-T#WS12)
+          - const: renesas,r8a779f4
+          - const: renesas,r8a779f0
+
       - description: R-Car V4H (R8A779G0)
         items:
           - enum:
-- 
2.25.1

