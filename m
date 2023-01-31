Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09145682442
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Jan 2023 06:59:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbjAaF76 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 31 Jan 2023 00:59:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbjAaF7s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 Jan 2023 00:59:48 -0500
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2110.outbound.protection.outlook.com [40.107.117.110])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B4493B641;
        Mon, 30 Jan 2023 21:59:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IxinNXIqClg7J1BoguUcJzatHO2kW6RVu1URo6U76zGxvz6jUbp2lhINcLgMO1r/ua9/2P7Mhhyn0qJr7IGxhton7yqfGgjEboxIp4ZF9O6vtPCTY/w4eg3wbaHyprxXA+Aw8x8VRAieRfB5SXsxkCEK1owoWgUMAkYJ37LgHg6fz4ylyA72GznNZVqMhL3TDih+Aief6CupOA3Xs1ZjAiurm/W/vD74pe7cOmHZtH4BEMP6G70sW22ic86d8QYlM+cCt6CWbgytMOLRMnwEgmliwkDYjx22SHIxUY8Q5ock+GooC7OHS0wwl46KMuXXiriOpYc+9HABLaOYQ/ZHcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bcOojTwWRfInNltB7gTPx2faTj4+hT7o1I87cObT0Ic=;
 b=XW8G6HNt1SM//S3ZUmPAOnBGddTZM7DV9gl+Xk8P2v3xC0u4rGf26AMcIZ6kMU1va7dk4urs/Xmwd3iHkCOpxtnjLxDd7zf+9hVikuxuyc0fkV3pMgXH8scpDVNe6k8GV+YCe+sDInIw+93Sat3RkYh2cm2fKOzpts+3G+1mtYNscSK8lmD62LCus/EozlVk90kTqTZNxjGCfuEsIxaZ1vJ4T6+pSdrxSXPYfQm7Ax4AWp2kDm9ili9wCXYTxBfLlRG+ACxJG2jWKNhmTURViptPblymlgrtYJyB0JEoN7zv6Mn2Etjqo0YQ4RphyQkZK7eg1HDqhaQDj2RUMSy4IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bcOojTwWRfInNltB7gTPx2faTj4+hT7o1I87cObT0Ic=;
 b=dAUae5MNrp1cFyXMODsxK43ey73Jqnaz4HtQ02DRMXcQqGv54YCTB+FkQfhIz28F8CsCd1kcCSSzOD3ozLeJ2SDT0TMa2jpSfV3Fi82ob2hDaBJnf078KZ9SGo6RZThVoUBMMahz/wF1wvZRGNkO0wejZKo28gqMR2hiNLva9fs=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYYPR01MB10593.jpnprd01.prod.outlook.com
 (2603:1096:400:30d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 05:59:44 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::3e61:3792:227e:5f18]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::3e61:3792:227e:5f18%9]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 05:59:44 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Rob Herring <robh@kernel.org>
CC:     "joro@8bytes.org" <joro@8bytes.org>,
        "will@kernel.org" <will@kernel.org>,
        "robin.murphy@arm.com" <robin.murphy@arm.com>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2] dt-bindings: iommu: renesas,ipmmu-vmsa: Update for
 R-Car Gen4
Thread-Topic: [PATCH v2] dt-bindings: iommu: renesas,ipmmu-vmsa: Update for
 R-Car Gen4
Thread-Index: AQHZMlhSG+P1Tx3KPUK26BD/OfHwlq63X8+AgACrN5A=
Date:   Tue, 31 Jan 2023 05:59:44 +0000
Message-ID: <TYBPR01MB5341900BBB1A4692BE085B35D8D09@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20230127140446.1728102-1-yoshihiro.shimoda.uh@renesas.com>
 <20230130193713.GA3213851-robh@kernel.org>
In-Reply-To: <20230130193713.GA3213851-robh@kernel.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TYYPR01MB10593:EE_
x-ms-office365-filtering-correlation-id: 30859c28-ecf2-441b-7f63-08db035059eb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nv76HG+G6ZrgZsKtNG2OvG3o7IDz86x5UwgBGZS43QtB0LZZ3mAkYuY2SdAHEfCKl0/ItB5zkI+vR4xFzIOfO8i52TbTvmLgJfOnCugPRUPvhMPIq8mq/to4mdrmxZh37y/DzqPUgg8NMSTgFlmhvPTcMxLGP0t0Rr15V0bmowM1IiWMGhOQpglm+ynN0qbdIJK7uN9YvvKT/fwkONZeWfsUpff87ZkdG3KJl+EXtb+w8aHP+i5wna+WdRZntfCwkm88pnUb+C0Y69+nhFfvSzUGPJhGWytBNYudnS//SIWfKBHi80mMANxQmY/B49AujohvKIq2fI/ikCXr+Smw80DCUuGGejHIgG42KmxJm/MkofjKGQDZA6jFkoXm/6IEJjWIPvKJp+N5pslSHsFopuyKeE8Gt2Ow9DXOuJYBoenlyGaNETMRejZV/jBnbnLB5/KOasKXmQVsY7M95uzx6GSgeTViEFQMhxuwj+2m9kvMw+RPEsml6xMKdmzdOhT8g0eFREKV62Ri6iHu9aqXonca5KxzK8z2sBTMnhwCa9k6PR8OepEKO3eJZFCcF6By9ONIWtYzClx9AZrA/lgqP1JwhGMIdbfZ+kFEi24b/biNNi1jXk1LqziXmeHxRSPlmW8JOJTEBPCJLK5bd4zn7XyU3kDG+kBHfXdnK19lcmw2tOHZvnzzzKkiAwbI+mWfi5CWoWUsDiyDCOKlFed7Bg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(366004)(396003)(39860400002)(376002)(451199018)(8936002)(41300700001)(52536014)(66556008)(66446008)(83380400001)(55016003)(38100700002)(5660300002)(6916009)(122000001)(86362001)(66476007)(4326008)(38070700005)(7696005)(71200400001)(64756008)(316002)(76116006)(8676002)(54906003)(478600001)(66946007)(186003)(9686003)(6506007)(33656002)(15650500001)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9PekW/rl1V3k2DQ9WbTTyt8HZWHCsSbesqswrqcFle+dOre6Zh8t0yXvLJNJ?=
 =?us-ascii?Q?LxAASnwJyRikg+5uBa4acY/0FsyDHti+h7C9UMEk92ViykIpRSDfneHUVtCG?=
 =?us-ascii?Q?h/kuiS417HLVh1JyHwKIroRGOy4uK6hvFrawCLv4Hww6GGhy4X4Al02aEdGY?=
 =?us-ascii?Q?XIRTpNUn0P0XevvPzsR/QjzuQX7KhHr5S4DyevYmf4lFtblMWLu3qq0aGFNC?=
 =?us-ascii?Q?KujF0bxVRQMAchSYwKl3Z52xmfU+sM4W/dPmIkXj0B5ijathpubrFoqYfToo?=
 =?us-ascii?Q?J3+JGkm+4lpYkg4MFIsCLKZBdA5le5bckoh76VS9+CHMYRlMmK1Oz6FHAV/Z?=
 =?us-ascii?Q?28V95olSemjrSPAWAd7vRj2PwTGlaUnJziuRkrLxuD0Ywx5aVVYoAv/nBi5N?=
 =?us-ascii?Q?usSTguzuj/RNS/0NaHJXybodEYuzVN4+nuJB8cgK73ce53F8f9W5B/WZQjW/?=
 =?us-ascii?Q?UwmIElh/TycWbpGXnwRDFoanFG77NInQpJnAy+UeuiElbQozGCde9dNjiv3f?=
 =?us-ascii?Q?aVV7wn/MTxDNDxtrbH0ZFkRSamIL4rRwTXxQExnrYcFdqdp07dcsy9p1yelE?=
 =?us-ascii?Q?9mxz7udhlltUjIqdTC62WceJD5m0H9ENet+XqINfQ+Mxo+9lUCAAJYU4GNMy?=
 =?us-ascii?Q?acBmO98sWOlmhntXfUGZNgLE2hPfoabb7LBnqETjacs+/EKzTgU+/SLiKLL6?=
 =?us-ascii?Q?MySQPOmIn9hyReaHvdmyH7h1OCeSYwMmAHUSTh8O0XAkat11N0KSV3vfSWvb?=
 =?us-ascii?Q?G8nnUB9WYeguARmSBEYDV+MgnrM1fm6X+FjJM799zd2YDOwMm5Sf/Ma/omnv?=
 =?us-ascii?Q?TQwM79VPGxvoBgbQZ/mwOBF4xX4dQOXxl6aduDrZ2v8tYnUPvJ+w7Bptql32?=
 =?us-ascii?Q?9Amz3QpIUjx9HtNra805mzAbyIc8KZ7QecQDJu/r+tMqM2lDpowwJejug72z?=
 =?us-ascii?Q?XfK6K0zP7bZ8g9Ofl0P7N0Nk1M2QbiYp4jm/zLxFaEai0AJMMuwQ4Mb2UkFY?=
 =?us-ascii?Q?KdhukymtVxqRRgES1py13xdwLEE3KSB/8IrOLnuLLA4lmvd6WUaUE5KMIcx2?=
 =?us-ascii?Q?LOwL7sS80yNvsaZBdafNF8LROobRS7x5wG+A0pEOBRFZ36XIIyQZLOBazch8?=
 =?us-ascii?Q?16QPzpniAH9eYndPd0XEy3ZqpMmP4EXtcGeGg70zMAFVn5bVXmmE5ZCTo27n?=
 =?us-ascii?Q?J1nm6Uui18g++FSRWpJ/mFGytt3ED4T9lMq4LPbzj3rFPUaCiMS1T8ik91cC?=
 =?us-ascii?Q?183j0XicEhhqymSMxE5GtZRw2XG1sMLxCb0WqsksGcyznGD2vC3M8eZtscGA?=
 =?us-ascii?Q?l9O9pQBaBQ1JKPUM5pIUL0+Eg6s8bAfoAjyIuUHaGBuoX5X605yvCY1ewlEX?=
 =?us-ascii?Q?IEhAYRMpu6tQnGLwKqXpsoHtsNjKFgCIOMQlGTEd2QqW7z2dTYneEFPTRoga?=
 =?us-ascii?Q?c7AiF2ZvrzBtBgCvCHCuyL/fCTf6s3aq4BfcZTiN0KIO9fnILlsoFkBp040J?=
 =?us-ascii?Q?MTWuCTuWUfJv/wFifOTUsNofK5p18TLSADlGV0AZwg1IH87vS27J2J38UW3c?=
 =?us-ascii?Q?4MZO915SJhvpi/DN9ZOs5YHOG9PB2VcTJDglSZGOGbT1z0KnXYLbSWfvotvT?=
 =?us-ascii?Q?RInuPJux9dnLsIIj6/B8IvegGM2Rxt9OB3tEosasdg03WowqCfMo++ExZ8vQ?=
 =?us-ascii?Q?9Z1dUQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30859c28-ecf2-441b-7f63-08db035059eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2023 05:59:44.3617
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aC+/kiQnz0KCOIpWjK8aJjvdcceJDod7sCNIGIgGOD3U4o+geYH+ZHecU6fnzSMy1trKTjUyMfiB5NVCI93MDJSYSYDlDatDflRaqTaahB6pf6xgeFjt58eRwGCn4hUJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB10593
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

> From: Rob Herring, Sent: Tuesday, January 31, 2023 4:37 AM
>=20
> On Fri, Jan 27, 2023 at 11:04:46PM +0900, Yoshihiro Shimoda wrote:
> > Since R-Car Gen4 doens't have the main IPMMU IMSSTR register, update
> > the renesas,ipmmu-main property which allows to only set the first
> > argument for R-Car Gen4.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> > Changes from v1:
> >
<snip the URL>
> >  - Change number of argument for R-Car Gen4 instead of "module id".
> >    On the discussion, using 'minItems' is a solution. But, it causes
> >    "too short" errors on dtbs_check. So, using "oneOf" instead.
>=20
> What was the schema you had?

I added "minItems: 1" like below:
---
--- a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
+++ b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
@@ -74,6 +74,7 @@ properties:
   renesas,ipmmu-main:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     items:
+      - minItems: 1
       - items:
           - description: phandle to main IPMMU
           - description: the interrupt bit number associated with the part=
icular
---

But, a lot of following errors happened on dtbs_check.
---
  DTC_CHK arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dtb
/home/shimoda/development/linux/worktrees/iommu/arch/arm64/boot/dts/renesas=
/r8a774a1-beacon-rzg2m-kit.dtb: iommu@e6740000: renesas,ipmmu-main:1: [0] i=
s too short
        From schema: /home/shimoda/development/linux/worktrees/iommu/Docume=
ntation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
---

If I modified the file like below, the error disappeared.
But, this is not matched with the commit 39bd2b6a3783 ("dt-bindings: Improv=
e phandle-array schemas"), I think.
---
--- a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
+++ b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
@@ -73,12 +73,12 @@ properties:

   renesas,ipmmu-main:
     $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 1
     items:
-      - items:
-          - description: phandle to main IPMMU
-          - description: the interrupt bit number associated with the part=
icular
-              cache IPMMU device. The interrupt bit number needs to match =
the main
-              IPMMU IMSSTR register. Only used by cache IPMMU instances.
+      - description: phandle to main IPMMU
+      - description: the interrupt bit number associated with the particul=
ar
+          cache IPMMU device. The interrupt bit number needs to match the =
main
+          IPMMU IMSSTR register. Only used by cache IPMMU instances.
     description:
       Reference to the main IPMMU phandle plus 1 cell. The cell is
       the interrupt bit number associated with the particular cache IPMMU
---

Best regards,
Yoshihiro Shimoda

> I've commented on v1.

Thank you for your comment on v1!

Best regards,
Yoshihiro Shimoda

> Rob
