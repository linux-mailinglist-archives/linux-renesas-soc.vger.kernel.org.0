Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EF045A619E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Aug 2022 13:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbiH3LYe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Aug 2022 07:24:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbiH3LYd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Aug 2022 07:24:33 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2093.outbound.protection.outlook.com [40.107.113.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10C81AE85D;
        Tue, 30 Aug 2022 04:24:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xcg1R12VFyk+PjYusNU5rf03nJkrcz6ci41qskO/Bkjpt5vbMn7bfFzyxq6E9fPa5ktzJMcSfrNu5xIu4Uv13Dxq0NO1dMEGRmy5T2H0ixSVkmVFqz4l3dCbdG9qFWcLimbFEj23zOVHdEl9uS2scvCb2Dcyz/ts/2jhKX8kZcYRUHD7QWI5ujiA6QOJYQ6qitpothnzl+f8kd+HUK2lj/HKHBga9v/UhnaL2IcrPTrR/fXn0ZK2mciuym/dQ7vlLrwy01RP47itJGKLd8sQ8tEB95j1bTddAsE6KKUM2yJzGUbw8XMzN7fi4eabqQ/mYWLR/IfeQ+u6SDPx6F+ojQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C5JCCzWNBy5ZrtfJ8QFEwr3aUezqJWiB5jY9Zh71Y7w=;
 b=T8AxJ78nHQGTr4zllDW+UowqPzqZtYMVz8rWix/0qbNM8bTtRMPREUDCvbvsUrnOR7QbV+yj3fbhvRVKwwB12mB0A+UOG/efGhxkfbTWI+ythBD0h1u2hDKfmkUyVDHYDgaqyb6SA9hu1YYwC0VhfoirwQw2LhzRbIubHWFGSom9Rnaa76teFDlGkOSa/wc0DRuhRABjD6eJFhwX4WN+DpCqlt9QbwXrAjLGe7Hr76CKRMOLbrgyfGOpv0HyRQXlzdHkTR61OD4iWltSz4sEebpcOt5IwT1Xt8RHsbcn5upHDz6MqEo4OP12GjNy8r6vk3uukZ/fAR6oH8A4kDaS8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5JCCzWNBy5ZrtfJ8QFEwr3aUezqJWiB5jY9Zh71Y7w=;
 b=P1kQ7b/BaWsZa9fTPemV2AcNoUjTRaiWNu4qZTtdbaW4R0dM06xeoCLZcuiFPXgdpPAnMbVlth/4Jw3rB/E9v9K3+qGoVEAg0lXOR84BK2iZCY6ebBFuGcZjoxZPC/0DOl7BPAwpbH5uPlYa3Cd/HmGJCm8CBMYXHwl7lk72iKM=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OS3PR01MB9675.jpnprd01.prod.outlook.com
 (2603:1096:604:1e9::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Tue, 30 Aug
 2022 11:24:30 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::307d:7cc:2021:f45f]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::307d:7cc:2021:f45f%9]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 11:24:30 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Joerg Roedel <jroedel@suse.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: RE: [PATCH v2 resend] dt-bindings: iommu: renesas,ipmmu-vmsa: R-Car
 V3U is R-Car Gen4
Thread-Topic: [PATCH v2 resend] dt-bindings: iommu: renesas,ipmmu-vmsa: R-Car
 V3U is R-Car Gen4
Thread-Index: AQHYvE6NHtyCo7L0q0WXIcgIO4LqLK3HTNzg
Date:   Tue, 30 Aug 2022 11:24:29 +0000
Message-ID: <TYBPR01MB53415E7C17DD3FEEF2650FB8D8799@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <36400fe2cc6b6dcc0d6984fb77338d4d163e84dc.1661849638.git.geert+renesas@glider.be>
In-Reply-To: <36400fe2cc6b6dcc0d6984fb77338d4d163e84dc.1661849638.git.geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d924dfd0-4553-4f58-657a-08da8a7a34a3
x-ms-traffictypediagnostic: OS3PR01MB9675:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AvN+HXKImIJg+YTGehGSUzafoxkdxMY2J1MHSKqb5DUiWhrOVsxLQRI0Hs3Eban095YRJzUADYvvZ3WyGzPOGei44S9Nd7TVKrtp2SkKVOas1hcFAni6fbkB54gN2OmPCCqEY6o9e5BPM5YZ+gVKKArMG96xxkwwwBnzKp5aZAZ3QpTqgYxz2MlJn+jPWqzsaFgIcVv9tgYD/IN2vaz/EdgaAlRXpjEG+OAbppa6LpB2u1Y6p/5lkPWOWW58ozBeVj+KOqgKYK3w3haredszmmfkymhEakTkMOORBOtQ3pbe532ZejjAEMnwtASGTchr2Rej9UJvbrTeDeWUpxEk3RA1+00EmZDw/EJwsOmBECC16BuZqDXB/ybDMyyJpm3vrHns2lCIg+uKQxobhD8zX1jbiWSDhNwn7Mm6FkGj2XGdN8UAss5ZyItQChOaawJLreEnLULMg6TbilfW1dUYKhDRamQJxyYP+ZDNTd9Ng+zTdc3zRS8LilsHoOWz49sWuFryBL5+x062XX9jzN+sMtqNeOMrqS13c1KBfLzYWO36rcOsH2Dcrr3H/FnWA/UaNohANqdbcgkZKJxTIHgxJTUZYIGgERhdtikOUHkWSLKp2ncXuXmyqXjUMkKHDXB4jyFWetgrogn8wXuE9t4GcahkgQSEhVwsaNNJKFajHkLLvLqD3hqYXypHDyfvFJZxUIkY8DP7SCwp+qlEelRatNGi69dNvBNGa1gosuc1uJ2MRV0tceMPYV5cCtKxOIqvxxW/sVuirjmoyYMSUN/VpA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(376002)(396003)(136003)(366004)(6506007)(71200400001)(122000001)(26005)(2906002)(55016003)(38100700002)(9686003)(316002)(54906003)(7696005)(7416002)(41300700001)(478600001)(4744005)(33656002)(5660300002)(8936002)(52536014)(186003)(66446008)(66476007)(66556008)(8676002)(4326008)(64756008)(86362001)(38070700005)(76116006)(66946007)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wSY6vMxQ6RuVVvC8JFoQ4kpOkcdkJtQH2V5uCiyijzNoZksYf8f4LVkG9RaQ?=
 =?us-ascii?Q?1E5F2I1OhajdRLIb+Tqt3lZ1cdRzxPm7dxAdB/rNZXCX4UDF8TdWInBOcyhU?=
 =?us-ascii?Q?3asVIYQttHzCRdo3JByBxt/MP2ClIYIuTlRlgdgmLI5Mx0iezvjCchKLuRom?=
 =?us-ascii?Q?Jc38gQe4y/eE8y7nMjVDllymfodcIZKv+9cSoUpb2cyRqUGYU9pX0vn1eWmZ?=
 =?us-ascii?Q?LEbpf8DMntNkMBZhHgeYLjuv0xxaknTSbcMB5mWN8plUb8minW/TUYDLRfDR?=
 =?us-ascii?Q?s8mYvOrCsABZfFQF66pWXbxlU9PSAmHLzohGxKOBO4dvTOIj+S7jO1IusZ3T?=
 =?us-ascii?Q?OokG08JCN8ut+XzPWyA2NWDuW68Hf7erlGhTLnlNpxbqjRNAytzpfpsd2Evm?=
 =?us-ascii?Q?BflksA7G3HjdMNpitzMX7s1aC3zBjoPsHsE4ET/iP+oAY3btvdB4ybdK18z2?=
 =?us-ascii?Q?PZsrUmrobA9rYHtEGH0ZpbGDUMboFQp/F7wuXaAiOoxFV3CaLH6sQ/b87OTk?=
 =?us-ascii?Q?4kv9rWZ90RevPAki7NYBtqoZ0tyD25T8g9a9Py3nRCthw6umY8I8gxjUfUOW?=
 =?us-ascii?Q?nJdR/P1B35Eb6cxxLXSuRkEYoFYiRTkcLYIR9B/YEwKWYuC6NAYKv8G4MBMD?=
 =?us-ascii?Q?fDmsb+JybcDp9T/57m1+7LvZFqb+RP85mJtUgv36CVGQjMG9zoaJqrkWpSQF?=
 =?us-ascii?Q?wxwda+OWoyWrujzOgmUr6J52XM74ABTPFRWIZ7waa6BIAfGmwnBWgxz8pcRv?=
 =?us-ascii?Q?M4wrgPS5XMbW2kI/dzt4/AeJEGiS/sbrv6xzU8+suQkAueFJUmt9Se2l9BxX?=
 =?us-ascii?Q?MXGJNiGM7Qz1A1/kHVIOULjsZc5Kxjk+/alLDgQ5Qg2twnt/dA5zAbkc5ipZ?=
 =?us-ascii?Q?EPweRzhxbvs//OMuSljGnSwgv2iAObu/VKUP9HUGqryywsBTwLijS51JHRWL?=
 =?us-ascii?Q?1ch/EsydOFdXb48a1vJoNs+Y9inMqS0OXm28Y+rxxxUsznU2Rko0EKdG+8dZ?=
 =?us-ascii?Q?lGO4K6glqC9mh95Ct63eynADBUxn80vk4y6VbsjkLcHqwC1OabsrhQcMeq8U?=
 =?us-ascii?Q?5js1xmP6M3JVFsSt3ZMJVK4eiyHZa1Q+lS7V6sgvwtYakohROkK2jcitPjcV?=
 =?us-ascii?Q?g6vGbJ3b4m/XIuyf8G+b28RMKNr3dG+bwEDVZhsAOhM0qbjwE9AjiMQMo6DG?=
 =?us-ascii?Q?1AJagW1yMqRyXe+BCdsjUlSFFd2L78mKncAWNtYqCu05UJIJT8FpDbRbN+Qj?=
 =?us-ascii?Q?CXhRZwfrRzURbRLlhQ+ZwoSho88Z0EAzABIwsVo7urHSTRQpU5yG0vKLc8l3?=
 =?us-ascii?Q?IM8LK2K9vZtK2ZgLkOHTwZHtEsfUwXMG0IfA/qiKuzKfh3fZGRhpoVm82650?=
 =?us-ascii?Q?SJbcD6xw5f19kbDd7dLAEbzUqavDxfVBhurEVZcZZkc4nWzAUkshPChhIuJT?=
 =?us-ascii?Q?Em+BGJikjQVwhkX1R8JvKTop3pa+puMGRMltH/djreW3O4BIULknpdRWQ+ZD?=
 =?us-ascii?Q?PDcqdwKbta5tD+5M0AZqjf0CQ9OgTMooDECUPUxbinZbOWqpQY/+UP8h2EIV?=
 =?us-ascii?Q?B1uRPfGItbWRyHH/4938TQQWz37lDFtFF/Ok0yLlOgv8VrIMbltO0xH6KtlL?=
 =?us-ascii?Q?oQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d924dfd0-4553-4f58-657a-08da8a7a34a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2022 11:24:29.9800
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iMyfss3B6SGPrzhZcjyDV5cBWn94zK6bjDJNqw/pF1gLpi1K3KSmF894Jl+PHKraPw+gno2/k/EhYG277hoKf0ZA+5+ZElvatTk8fLjPtk6NfkMbFN/SZN/7U+EVHy0b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9675
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Tuesday, August 30, 2022 5:57 PM
>=20
> Despite the name, R-Car V3U is the first member of the R-Car Gen4
> family.  Hence move its compatible value to the R-Car Gen4 section.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Joerg Roedel <jroedel@suse.de>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thank you for resending the patch! I completely overlooked this...

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

