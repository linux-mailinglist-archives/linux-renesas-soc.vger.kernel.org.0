Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4F286629AC
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jan 2023 16:18:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbjAIPRo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Jan 2023 10:17:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237301AbjAIPR0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Jan 2023 10:17:26 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2111.outbound.protection.outlook.com [40.107.113.111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7200395D9;
        Mon,  9 Jan 2023 07:16:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fEfGjtis9pXvu/YXyJdAUaRzutJU3Hoc/4ah1VsRFOuV/V8xG3fYKZSE4ZCug4j/7jx/szUuikwq+6FeNbyokEx80+ulqvjCrJajuT1ZgKWKh3Y3XQCFZl1ooadmPNLkw5p7cHrtMdrnxzoeVHi1crw1PwKADJF32n7oNv/nJzwlHGtKjWNAGa+sugviipuug81Nq/tgaVmd7Fry1dTsBYv958ZJq1Z0mj8i8JHYQIwACjWacAB1EZlmyEutuF0WoF0lO/cKG7UWHdPCTnsB4stFEnpP1hGIGTejHJIx7tRLjCwcPWTidZhnFhdv/mFGzUC4hjcFYMfR0jpS1I/w2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nnqeNvfcI2MF7VtXLW1gkelfmE+FclFJIIxTksvI/C4=;
 b=ex40ILqhI4OJ/nhJBpNkMM+RedapsqbLR/rmIsxVnRsBhk8rxwKBJgo/1AMeAJr4G3+zszo2GZ2JGqgEHoX2wSCgw9atWl+eC/bfbEWoCIztyMLDP2KSeccvoH/HaxlzQdNt93Zz+B0Pvdg2pvoJliyXzifn+Ldz686jqUl7wQMm7eg8XEv5J5mLdn+LzVuioQCCL3/cf1ds7rN+KTF6R7EpU38eBqGKm3nKxiYhgjDsMB03FBUqZontZ4be+VGJhB9L+S3ST1OIxHlBB315n3CtMiW3d+66URRMYRz4fnzgsOP+LYlUgcciwy9bsRUiYpLMsRjvSKcDS8Y9wy1CUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nnqeNvfcI2MF7VtXLW1gkelfmE+FclFJIIxTksvI/C4=;
 b=mUsiye5xrly0hGqNeY8ExpFb0hoB38ja4fqpJxNr4g6uX5cQwnLbg1gpq9hccUrb7OiwozYiXy8QJizDLvs5JuE3QK5+5v7PCNpyuXAFO5Q15mftAunVV1TyWt2/s8d2tomvXwxTlDoxW346SXXynJ4udgGfKOei4Pja3KY6Vfw=
Received: from TYWPR01MB8775.jpnprd01.prod.outlook.com (2603:1096:400:169::11)
 by TYCPR01MB10463.jpnprd01.prod.outlook.com (2603:1096:400:307::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 15:16:06 +0000
Received: from TYWPR01MB8775.jpnprd01.prod.outlook.com
 ([fe80::9459:ffa9:a884:8a8e]) by TYWPR01MB8775.jpnprd01.prod.outlook.com
 ([fe80::9459:ffa9:a884:8a8e%3]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 15:16:06 +0000
From:   Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] dt-bindings: mmc: renesas,sdhi: Fix RZ/V2M clock
 description
Thread-Topic: [PATCH] dt-bindings: mmc: renesas,sdhi: Fix RZ/V2M clock
 description
Thread-Index: AQHZJC4JH/dShzk1Mkmcy/uUmY6HXa6WMbkw
Date:   Mon, 9 Jan 2023 15:16:06 +0000
Message-ID: <TYWPR01MB877510A0A44E8F39C723A052C2FE9@TYWPR01MB8775.jpnprd01.prod.outlook.com>
References: <054c9f4dbb0bb1525f780d1e85c724436465c20c.1673270716.git.geert+renesas@glider.be>
In-Reply-To: <054c9f4dbb0bb1525f780d1e85c724436465c20c.1673270716.git.geert+renesas@glider.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB8775:EE_|TYCPR01MB10463:EE_
x-ms-office365-filtering-correlation-id: 7e9fe82c-e0ef-4637-7e61-08daf2546e5f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l13EfcNyzcgAVLLSoVhDM8XJ56Wp3DK7GijZhIIXiSvO4n5gO0GyhMt37dkRk8YZlALendSyA8O+8KxCyI8M4oN7cscrnfeZ1tZ2VBYITzuw0Sz+UFfdUiAaPSxRFR7PAJ+8UEdkAs4PdgHKDPRTN4Q02+4uQmypaR3aG9E5++atb3RGGDZ6UotJAd2ib57OZ4Uq3JKI1KwPNYuLG263gJUq96YKib3+H/VNUDCTIg7fh6y7vgRDQ5raV6q/Vsp35N5VTrEJpSwheRDdYvmNrwm/Ot5VzWT3nBTUPE8EfDIf6j8NE4FUFE3NcBD4etFebVCm9p3PUshlVPyi9cFLvsSVp8QqPjv7guPxmpnWDE/1pstrp33RwhHEOcmyj33z6GDDqWtEvECe3dtV6d/sTF0y9uKbTyWsHMrEjtKH+pWF7e95Jho26xDsS53zvKkF7n27tukwZ8VNBe4kO1knY3T2lgp5mh/r6ZYb3Ylacmn+ZlNFS2JQgCpMceyyelfUDbj0fg/+w92nody+1wiO2Ci96InYx0K51LxhKJ9tBY8cBQAwu8H+1KlmyAOUSohuVfRxNm8RE4QZJ6kejNWUwh6ZMowIM8Y9M1bswjbNjs6dBNNH5gqmgfeGYI/U8UREQG71ja69AiV+iJOhvdMgeCTVvkkou2xFCcua27qamefj+Ku3MyIgf5BzxTjC8B+eGKg6q9FgmDuqRNcGUVeICw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB8775.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(376002)(346002)(366004)(396003)(451199015)(52536014)(66946007)(41300700001)(8936002)(5660300002)(2906002)(8676002)(64756008)(66556008)(66446008)(66476007)(76116006)(316002)(7696005)(71200400001)(110136005)(54906003)(33656002)(478600001)(6506007)(9686003)(4326008)(186003)(26005)(55016003)(86362001)(83380400001)(38100700002)(122000001)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?blOYibCmMbyJnmQakPHTc9bB137EZuhGPFxlzOqTt1x14/ltgqvSBK431tW9?=
 =?us-ascii?Q?OD4YigjLcn6ZKDAV64p6YLEejwnqK7ZDKMCBkR3EWi8Ce6S/8A9/D34PYZH5?=
 =?us-ascii?Q?XZLlpZH3vPwuupBX7kK1iI/H9r1cuxrjW+VggO84MCxu3OqFaORiqpwQgZyv?=
 =?us-ascii?Q?GLqaEzktPcoWzfaAUkjzH9lOWKio6kO9p16Q0BXSWeyCMh0T2k8kYMTyUkLZ?=
 =?us-ascii?Q?ZUPeT+nrvD01Mi8dDlDjx//AENGj/yChXuP1B+gs7uoOP4wW/r1srHK6M+3n?=
 =?us-ascii?Q?S6DdKZ6LSWeE3QOAPlharguze6bqi0NNkxGCA9jKjAEFod/xH49yGW2MoPK5?=
 =?us-ascii?Q?8IY3wu75H38WZUE/GeM3cHnbdcQbBv4cVkIA2kupQx784p3JuLn4j3+J2EJg?=
 =?us-ascii?Q?5w5B/gBVxIwmdgjC2vpYut2WDNt6sV901cNLQshMRjwKr+bJW+VTvS0WVohb?=
 =?us-ascii?Q?fZc7+P/z3KWhkrbddWOD73G83z0ez4ZoF75xYtduGlMUQw0JBIFnHd7VklRl?=
 =?us-ascii?Q?lLkenXjUL92+GSJp3jTyjO0Zgh+pZxoXJpSwbGTbtlh3qnP9lcUbuuq4can1?=
 =?us-ascii?Q?tHE53qYlNek0HuUcJssnwzkt/o3T80l9J62HhHZ6BRX6izOonXcuNx0gh9Am?=
 =?us-ascii?Q?s2B6MDMNj38vhjlAOp/bzZOdvXA80J9+WizVAt5eghKXtl+PBlnISA+LHduP?=
 =?us-ascii?Q?L2WO78nIBMgaxWKwroPhvbkEO3pKdeu9PBRAzhDQz7aGHx7Pd+l6qq7CEilJ?=
 =?us-ascii?Q?hUCNKPlUkk9DaWnrPzzraIEHiCxNT6CXduiOhKcLPifJnYno9SN7hG2oHhKf?=
 =?us-ascii?Q?SqH9Ke5HlEe+FGdTeZqJ0HlAdnoszAwbx62dx0INIlBKOBrFzn/clb4Gqe0e?=
 =?us-ascii?Q?Dj1y4N/rard+3GAT4OJmCTlZTP2tMj+OL2TWVr5zmzhiUhqzejofy0NDYTB0?=
 =?us-ascii?Q?v3F7RzLqyxkZCRPZByt0z2ZyjXC/Mchu2Iar7j3Vfb5pJzTrh9hajfBrOcgF?=
 =?us-ascii?Q?RpfkglcPA/nItYBJ3IMYT1eVGCLO5LX7cYsij+UYdjYz/W1awx8+18+Ioyda?=
 =?us-ascii?Q?Bzi2XnkUzzH2vXNBnneX/r3YlA0Q4tIzbEpE7NPnZiXBXumlgk1tVRuwkm9m?=
 =?us-ascii?Q?wvI7fko1MMa0qeZKjLwDkAyQtmaWnuU/fCI0HKvXD13ZDWqW2vXJgiF2g+90?=
 =?us-ascii?Q?L++PRDn9bnD0pRC47rtoxdjJ2m+vJb0I6BKZCYeKGqOSjnT68vn6aKzdz+um?=
 =?us-ascii?Q?xHC6yzCxh/f7+JzjnDgg8jMPIMGr1ZS1RSEPU+SC7EfrP0CfJ7QDyUJzku/f?=
 =?us-ascii?Q?Mu4QzAJVF/SlODPOTLwHxLHzqBXyXldFK9kBcnEwFbV7RzOH/C28JFIWxebu?=
 =?us-ascii?Q?E5O9pJ5KFdhCyaILB4ZLRuDYoW+MqNSxhTPkpYkokeBsJo2ZI9xNjILzmZaH?=
 =?us-ascii?Q?BHKE4cKP5f+rR74kYZpAqyOj6RfBdove+SYjhYHDY4wSYP1hrOzPUQrQP0II?=
 =?us-ascii?Q?WIUj8l4FOAHr9XBIz4poNzm3SCl2iPuoMz7JGehtNP45wqq+a5WZB0sSLjOC?=
 =?us-ascii?Q?WkrsnqwQVnQe8mVgGhttcITiRNLm2KQ5r7VV8sz0TZsYF+EbHMxzbqPxEFqh?=
 =?us-ascii?Q?lQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB8775.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e9fe82c-e0ef-4637-7e61-08daf2546e5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2023 15:16:06.8647
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RRYqBLOgCZXZiDQGZ2dvbfB4THC7Azy+HSIn4MDz0jcuN3rEyrn10C8lcziQC4/pUS1EIFo0bXvgxrYqtb6VXJHEBAGG7ZCEeRxCpw/5fhA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10463
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your patch!

> The SD Card/MMC interface on the Renesas RZ/V2M SoC uses 4 clocks, like
> on RZ/G2L SoCs.
>=20
> The current description specifies 3 clocks, like on R-Car Gen3, which
> will lead to "make dtbs_check" failures:
>=20
>     arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dtb: mmc@85000000:
> clocks: [[3, 1, 18], [3, 1, 20], [3, 1, 19], [3, 1, 17]] is too long
> 	    From schema:
> Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
>=20
> Fixes: c8dbdf2a1044951b ("dt-bindings: mmc: renesas,sdhi: Document RZ/V2M
> support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Thanks,
Fab

> ---
>  Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> index 4357736074898ff3..fa089cbb155bd0fb 100644
> --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> @@ -122,6 +122,7 @@ allOf:
>                - renesas,sdhi-r9a07g043
>                - renesas,sdhi-r9a07g044
>                - renesas,sdhi-r9a07g054
> +              - renesas,sdhi-r9a09g011
>      then:
>        properties:
>          clocks:
> --
> 2.34.1

