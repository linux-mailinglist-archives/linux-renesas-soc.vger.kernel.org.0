Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A739520AAE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 May 2022 03:30:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233348AbiEJBeB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 May 2022 21:34:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231250AbiEJBd7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 May 2022 21:33:59 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2137.outbound.protection.outlook.com [40.107.114.137])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A943428202F;
        Mon,  9 May 2022 18:30:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FmDhM043qpbhkZxovkqrEJInpxG05tmqxlDBfzt6wO+wtmoZCjzakifI8eqklo2SEw8Xni3q+uZIo+gTuGQGg/toQPWdySrnCC5NpRXMgmcPy7UdsV67yNfaQ1TcWvvMrxOFTmTYJ+uKb+FCHNhgaLiW/Ek6boeuH/T90SsiiP5/UTpJ0RNE/brJVjeIosKYWRfBjkatdHCvEzovYjTMUo9pgi3yOURA8CGWcD4wZt/25uL4GJEZNmMDMKz9q6pTZI4QRm5yKmXPWKVllqZGB699m4VRj11DKTSy0rCV9oLZOWmJliOvusZpUf3H2vCrjGmRTj4RV9QEszz0n/7CrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7se8+BKyEwqsmScSTluMl21lYloFAhnPpdU+5lngDpE=;
 b=fAMsQ5hqNTk6SPn85Xeh5/JLgotWTm/b1bHoglhKubTkfwpWsoZ6PEImwTjlDQT7ECB/TKoCM8oY5ACFjmWZLPv8yvA2NCTUusL2n1xF83e7VsqNMKnhY9q+HaFt7tj3vURMmcPcW/fjxAGRpb5bVuH+4GMvGeY9NejdpF/y3mbbuvDDdjvEakvsnO4Yu2IrZCK4EH26Zu9p6tqD9NjxrSY4Pb4v9HD05pCSXsRGGFdGRr9xYu6DIpMK+Rcxx3TnRVV8/TusMeXOL5StrFN2y7aZYwKe1ozuDuFDAExAgX9rex/w1RmwvK8Fy8KyFHa+cr83WEreT834a858lXBmHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7se8+BKyEwqsmScSTluMl21lYloFAhnPpdU+5lngDpE=;
 b=a2Cq6wkOawI0SRXkdqWyDMgPtc/0nXxkcKjs/O9sDlcMmdhAN6g6RaQ0I0N0t+G8DjZgJYUI8qlRF5/O3pavSJVa+OQCHZFd092stSWSjo0oc4obBhZG1JTMIQrjYqHYGp6FCn5zbhSeW2x45b97YxeoFYDlZGcVZlpuw4MYxto=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OSAPR01MB1602.jpnprd01.prod.outlook.com
 (2603:1096:603:32::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Tue, 10 May
 2022 01:30:01 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::205e:c981:34d8:dbcf]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::205e:c981:34d8:dbcf%9]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 01:30:01 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] dt-bindings: phy: renesas: usb3-phy: Spelling
 s/funcional/functional/
Thread-Topic: [PATCH] dt-bindings: phy: renesas: usb3-phy: Spelling
 s/funcional/functional/
Thread-Index: AQHYY6PPVd/gl25+SkSRhYnmZ/jQAq0XU0JA
Date:   Tue, 10 May 2022 01:30:01 +0000
Message-ID: <TYBPR01MB5341D9150304DDE3D936B2FFD8C99@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <3da9bd360e1c83007af0e0e90fa4e6c2b50fdab3.1652100633.git.geert+renesas@glider.be>
In-Reply-To: <3da9bd360e1c83007af0e0e90fa4e6c2b50fdab3.1652100633.git.geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6818207c-df72-4447-b6c4-08da32249a1f
x-ms-traffictypediagnostic: OSAPR01MB1602:EE_
x-microsoft-antispam-prvs: <OSAPR01MB1602C7CCF556F5227E2698CFD8C99@OSAPR01MB1602.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KtX1hzYIm1fjDTwvzMJ4aOlGtWB2VhLLL7P0H3fZJPcL3EmZ3IUq3JJD//pxlDfr+5C5diVtq9I2MkZ/y4r4ke2lMn5Qm0qMRdXxD/E4Wl/pZKY/G0QAq4v0raBJT3Kde7+BMQCbORJxLcg45D44b7Up75henTrr4FwylT00HDi3M3UYybJav7B3uz0oXbydaDM0NaE/M/THJ+b0WOEYl2LSXaPUkg10Ht1TdcV2g+nq99kh9mTlksw4O1Rq1LgoHkuOGH8BX5BJb9k+6qTChvSjoKfV3Uv5DdK7yhlWHsj6Ic8i0PaecDW7xLLjsIr2jeQXn8WqYZkewHxkReIn39gkz1nGncEIGsTJ7l4Q9ilChKVUvK+clapJi8g53bYNzFa0plg/rDqQNJneLhHGvctPvIf0a0TlDT5RBM7N9ngizwnRBb9VFz5Ngo6dUisBT2M8Rt9lXFo1HUM+HKVSYlM9j4vRMtJoOomO4IG7u7yJHeoEeUPxZ/rG85gnR5uJN0/VizoJW2gNRap560b998twg7USdhB+TUBvhEK+iRaLYP4Id7uBP8jfQLrqhMwGkTl2JPAj4+lNVyCbka+7bczoB9YIXs7Dx8bl/iuSWcrEddGAiTvOZzg4FiMaasAg9zsX3CVgfKa4a8/TMRStJl8MuIC+Vy6kNZa1yf/PYNyvvQNBTCb8rBxQU0ma9DTv1EfuoU8fJuLz170jBiKbZA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(558084003)(55016003)(71200400001)(33656002)(54906003)(110136005)(38100700002)(38070700005)(122000001)(52536014)(316002)(8676002)(9686003)(4326008)(5660300002)(86362001)(64756008)(66446008)(66556008)(66476007)(66946007)(7696005)(6506007)(76116006)(186003)(2906002)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LH+Sxa9xBftpkUNZQ26FV0jKyhXtiSSyIcmhk/aMgjdGe012uLy9q2D3GGgH?=
 =?us-ascii?Q?9h22HLPuy9xzEY2uUiQUn5MzhWc+uvnY2dMTr56dFcsbyZ0spGBCwUMfjsbC?=
 =?us-ascii?Q?Mwk+CNjih8FCUcI48Au8AJH710P9q96nXseBuuQQfdi8fgXB7USt8I6ypcNy?=
 =?us-ascii?Q?oDmZA2o+PyG6YPR86MAQqb37VX0u/6kDQZ6KOHshVpV41qp61jEWAxADnwYK?=
 =?us-ascii?Q?6cxRdRskgXG05Kzs3qA3wQFql7c6ZISJ2PAid13sQ3aJJUhyFIEF/9A70d5w?=
 =?us-ascii?Q?jyoci3AgpB2X1bCh7mOw2M3vUtjrRTPmaMdrGWfIDmJP5ZhqLvyqKB/FBvcy?=
 =?us-ascii?Q?XzfycFsUjIh1BkdRTZToNqLBMKjs7uJheIE5Stq21Sc/hYBhfMw6D7HNKcPw?=
 =?us-ascii?Q?7zDRQ/rO7tEaNmINcRFeEhpIXft7o1K/Q9czdxhBe+902M70xUov7mpSYzS6?=
 =?us-ascii?Q?1tPVheWoX+tQECr2ymALzmRNkwIryeLF2YFN0tI8C2UqwbSK6DcQmIjOQ+qF?=
 =?us-ascii?Q?qL8rkBOb89+jy8l9q0UaxgCXEAmFNSH7mgVQ1wy4CG3ETuFHUPBbV4U4nZtO?=
 =?us-ascii?Q?pvf4ggXimqi8HEk5Ltzhki2saxgWl7OwPUAPJ2CtYO8TU3WOH8CU9BWy7MNH?=
 =?us-ascii?Q?GKpyKja5GQDX6VN7iMrVISu1HxE3XVkOQMliMoXMhdljVGoGFv0a9NyZu2/w?=
 =?us-ascii?Q?bC98uvxaNi5IHdsaPMBzW89I038HgMu/JawQ2x4SdnAD+Ag1NYnRK8hr1mct?=
 =?us-ascii?Q?bTuKuCxEfIIyOJpV9l6+MIHtwfkz+r4IBDgUa1sULeQML3xYzhhIdlqSs4wV?=
 =?us-ascii?Q?B3bT37bTXzKtRnhp2wpYyfvotM4MUUBuj/a+3ezPoHKfBd/xA5trYBnl/kze?=
 =?us-ascii?Q?Br50hbWGakeqmfuQm+dihFC/TQ5Xnf3AqPgDsw8vT5O1yYFTkkdC980rvxRh?=
 =?us-ascii?Q?FoX6i06ZgzeSpVPw4XheKmhHnY1rDn48RHEmefmEKzdDLBrKLtmM50ubKP46?=
 =?us-ascii?Q?juTeN8fXy516COy9pCMbKY8MsSVs91XFZYkY7YJItdr16KVmJh0gqp7aNdJN?=
 =?us-ascii?Q?UWMDyQ/AH/mdwScT2b8jP8fPjAx+UpiHaA7yFwzJgBebf8Wvxbkd+HmrwE5R?=
 =?us-ascii?Q?rxyh7EZfVX8erlf5zvIl1uvghWv9K0DIMrLyknwgBsnSbvd2cyx1nq6+YmfW?=
 =?us-ascii?Q?ervNCQDeG2BTw7Ia0j7jK2rh8erE51Vm9RCpBUNmi1YqhcXAhJu64RyJzdOW?=
 =?us-ascii?Q?KhfEf9KBo3KdmJcbG73TyzYKU6BY8UYZpwKSsFtRh+x+P9yMBB0bHytLlrIF?=
 =?us-ascii?Q?4MnncALTQy/WBjxinSuT3zeP/dvuPHcDRitajlGFdPHJijunn+fCX3qQKkdN?=
 =?us-ascii?Q?lNUE04mB+/6DX6rs+smL+JT+ycPmHV3A7XzUrYDgEb0aKUVpeiHOrpMhMZWL?=
 =?us-ascii?Q?9/y/rK/PE0OyH4Cx44rfKiJEXmxoY6DnPMVmAJguRgBKVVGTlQmwB1MbyaDs?=
 =?us-ascii?Q?niM6qCvWohV0VPW5PpplTOgzXic9p3HKxv72iyxRUvIspbW5/gIQGBJ7rqbX?=
 =?us-ascii?Q?tGsSz1I8HGg37xPX2TUVx7zCeG/3ul92Yu7xpiTOxpgpgLGeF+zQmQ3nCdGu?=
 =?us-ascii?Q?Z/kiz1ynvacX0yOY4/am+Gx9oBzavKTJJtaSFqEqvdl/wKXwMDtjAM1oBnrW?=
 =?us-ascii?Q?U2basjb9QdU8mgR9nttnR0AWneA6Wr6DfO+LeLFIP14BL2+/Z1fHOBTSI9Oh?=
 =?us-ascii?Q?VMu8LeaI13UfuIKWnANxiMB+jL5CwLyxWsGG+wRFQoTB0BPZLREbo+bUKkz1?=
x-ms-exchange-antispam-messagedata-1: ycSThM4Zipu8E4DeM7bjAHdEEVQDCOQqyF8=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6818207c-df72-4447-b6c4-08da32249a1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2022 01:30:01.2015
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rRiFT71NJ3mRdn5CqbSZxCkfcrd4GBDQRA/cu/x1+4c+J805x7THXfFewaxvroyMw6guzFkZ7XPdAXhBc7c0Ax6X5tQDlfgseXVeQthzRah67V3wuEqpFe0PLJ+0N1Wa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB1602
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Monday, May 9, 2022 9:54 PM
>=20
> Fix a misspelling of the word "functional".
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

