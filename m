Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 665793DFE21
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Aug 2021 11:38:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237101AbhHDJiy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Aug 2021 05:38:54 -0400
Received: from mail-eopbgr1400110.outbound.protection.outlook.com ([40.107.140.110]:36640
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237071AbhHDJiy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Aug 2021 05:38:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ltAwU5iPj401+cpivAO4z1xvkrLEeM3q4/VNIhtP19Nxpifqx/kb6kP/xjTTvlUbRHnG58c/zY1gWn58jViT0ebD/5qFrzWbgBS5RZ0fZSSHn8q3v3Dbrs2+brOcYo53O836TdZO3V0ZpwvAMCBMLzbPJ3SSvl32QrEF48Ispcb8sH5ZHwi8zeBFPCS+1TC9019aLyFdxxzX2p3+RltAWeYvX8PXx7pa9TTZW0l8P1heZoKWLs3cDtuUBnYxZtdQFVUXXe8/OLsSk/k8JfG+BhP6BojfM/pARVzEXdbttNFeRhc0h2bFvQAbaiwvXTsSaIwFgy+Hed6Grm39Stul2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RxkGHeWYKsznXRtw7JdxZiZA9EbZ2bEoFWbvicoGQx0=;
 b=jY3yNm26dZf+cu1hb0vjSvXosMyBetgHYS+hLeWvOZdjwq5oadwxLr9+c7tCqwPynwHhFgkcR/amxgiPHvmlm7zMWx/4A5RemIGwuMsZIup4zX4incyDMMtzLFMdqM9JP1CZOX1U/cw546PP7UaIdJ56egIesaCyR0Zaey/a89D/20VhIUVpJMh3nKLMm4ba8DaWcOxbqyFmUpAmswn6bbBFrLvpS0CorPgUDwpYx7iPkCUBTNBzhYgpFPZZFqDEDJzEAIf7isWOd1bQWj0Vumeo4cGxwxlVnMWaA/+LSkpzmc2y3qaFjfh36RlGZSJKOWWWxLwYcTt9y73OX9JAMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RxkGHeWYKsznXRtw7JdxZiZA9EbZ2bEoFWbvicoGQx0=;
 b=fZCijuR2eG639o6WskJkYlTPZoGLcn8bdO6HEf2llyNQVSVZezz3e0+mf2moruDtEdu6oQTxjUA89xZGT/8nJ1kmu4yrBlD90YXJYTZ8Qs/AiLrU8+loqcH0vGLJcA2rIOf1Sa0MxELbUgGLxPxS16iE79W9myEv/DI4X9utTe4=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYXPR01MB1552.jpnprd01.prod.outlook.com (2603:1096:403:11::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.20; Wed, 4 Aug
 2021 09:38:39 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::7db6:310f:a5ed:82f6]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::7db6:310f:a5ed:82f6%3]) with mapi id 15.20.4373.027; Wed, 4 Aug 2021
 09:38:39 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     Biju Das <biju.das.jz@bp.renesas.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v5 2/6] dt-bindings: phy: renesas,usb2-phy: Document
 RZ/G2L phy bindings
Thread-Topic: [PATCH v5 2/6] dt-bindings: phy: renesas,usb2-phy: Document
 RZ/G2L phy bindings
Thread-Index: AQHXgxkAw3mBso2vnEKBMhI9TQt7CatjIgpQ
Date:   Wed, 4 Aug 2021 09:38:39 +0000
Message-ID: <TY2PR01MB3692AD87163F3C1FAD471FBAD8F19@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210727185527.19907-1-biju.das.jz@bp.renesas.com>
 <20210727185527.19907-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210727185527.19907-3-biju.das.jz@bp.renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bp.renesas.com; dkim=none (message not signed)
 header.d=none;bp.renesas.com; dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 79630e6c-109c-48ec-953a-08d9572ba3e1
x-ms-traffictypediagnostic: TYXPR01MB1552:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYXPR01MB15521D37D5648DE65A9F278CD8F19@TYXPR01MB1552.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k61YAlMHhxXJb4mCDq4rDape0cmduEQD/lQRMJIM2mjvhgsb44vzJiKasWE9AGWCr0bB4Lrc6hZe/3KjTYFGdUbc7yEXfWbaAgjZ0KetzbwEa1q81T2KCKCj20zLOj1MNW45572vyCEeX/OSKvaQbxfiXgXEpft4D8dRkNsajY1OEtVBhbcW9mlUGQSuUzu8FgfqcGmfMiz/qAfPo16dDXS+GZgUyrF0M9QMhmRVFhiZAol8Qm07APFY04yoH83NAtqVYSBZLsl0dktIprnYxiS8sesw4iuGmBTbyoro9rJRU7J0iROW7Xv2n8tjuiiQEVg+T2389PAGUCxp4JEx+mhAnKLetgLOsKjgQt6Orvr0/6GzvA0uktHwPJUGVtVenVcIRjmZXtIqAdj/yYdFORYN+kcQqTv99MC2hEu+9CLMGj5x0xNsupZZv4SOdUy2hJMP6Ent0r2nU1HYjAvPwfcSvZv3SMT3bB3BUSuaGLKycDrJNV8W7+2SAygjOaM3qk4/GqfZEtVJ64gMTiSepA6uxf/4nZHqHtp66rTW6p2JHiReQa1ccrCsu7VM5AxOCxu8IPXxsAvPtvaRjqt8nRx1/V7b7egm2gzWY6so2365Lsr2ZXH3SJtJ5ZdBhC8QDzuUuJsl2LKDGzzJHArZgwxW9qcAQCW5MQouzEQxMdlIoN9v1toYJH2Mt0p16b59BUoFyGvnXV2VkKj+uAQjxg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(54906003)(4744005)(5660300002)(508600001)(9686003)(110136005)(86362001)(55236004)(2906002)(122000001)(186003)(7696005)(6506007)(38100700002)(33656002)(52536014)(316002)(71200400001)(76116006)(66556008)(66476007)(66946007)(55016002)(26005)(64756008)(8936002)(38070700005)(4326008)(8676002)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Q4z5Eqtfb+BRXIkgtJYZml83mMlyep4UgMoWbkw2oxiGq8gSkTGeuzIjelQ7?=
 =?us-ascii?Q?XJHuQq6hKLZlaD0nze+3PSRwaYUInw3Sj5HQpziRlVvdYEvgj054DNgOSn0m?=
 =?us-ascii?Q?KaCTh1U2hRJVpbkD1elUR5R3ZEbjnvvXuQURRkKFIGIEK70Un7+oJAs0o0Tf?=
 =?us-ascii?Q?HN0K6qy68P0DtMQMzRVZ0rKbCLpBrctJmx+zaL6FPvxoHz1bep4JOlio0Duh?=
 =?us-ascii?Q?ICP9QRHQaPt1rNBP3HPBNADv9H7IxTqeS5NN3u/91/EJnoYeRutlnRgrOqJ5?=
 =?us-ascii?Q?hGKU5DF9QHq06+rirffCbnDiy5Z8Gmcne4O3xos0HjnpiA4Tz7kFFwO0Pkzg?=
 =?us-ascii?Q?OEnsQSKkMNUNJw0v6huE6doamZcOlwcc96RwVknsxNuVvAsDWfOQ45AbBsVw?=
 =?us-ascii?Q?qKsj9CkNQgFCS+ILIiaRfA6MigckTXSFzC0kkrdS+UQNw8Ki6Cxq+Fpz0Kmk?=
 =?us-ascii?Q?mrUnq6dT1403WAv7Z4s/fUsqKOson5Z46dxERJkphgFgH65oTTn5R+dGw1Db?=
 =?us-ascii?Q?mnnsEIa05BbXu/xFGbyVD7Wzdho78O+bVZ9elLI8wEbCWAC9vw8aYUqcVxGA?=
 =?us-ascii?Q?UDyeWVEj7KQCs0ZMHV/MoR1DFhQx9x670uMgVxMQfXc1S7ZO1/2cQl95gNBP?=
 =?us-ascii?Q?7G/jxx9Eur3o3XjckxBa02LarbCod+Xva7Ioi13KGn8bFvlQDqJ9lWUo19FQ?=
 =?us-ascii?Q?2jqw3Bi3OxDOl5Rzl1YnhvHLNqxlWzDjXMcRNrSAAL8W04yVcHWSCVNZPF+t?=
 =?us-ascii?Q?/9SqhH64GY9zdZ9JqN8QGQxkTnwIEvzMuctGmb70Dk314X6WzdLcsOLzQN67?=
 =?us-ascii?Q?WyOvzCtfSdEbz4q7ITATWy7oCpLEpnSRWHlg9rq+0qufgMYs8HtPoGr5RKIe?=
 =?us-ascii?Q?EuS/Owv/s20wHzHCe4D0tbCzznVzWjVnuuep90OhrYOY53YIzQ3Pwc8oxgU5?=
 =?us-ascii?Q?D6ciYQTE26qoZVze4kfUezhKoA/+qaU1YHktmGYRjjgJmVnZJo/TQ49d2u/M?=
 =?us-ascii?Q?fsyXHammud60ZAB/lpYiuThpOGkiOSEHVM9r60o7k3i2e5qN5dus/eesFcJ/?=
 =?us-ascii?Q?+cca8nS6epYiPSRkUD6pbBpcyKeqVPCntq0kCJUK5SLhPHnI1C77/ddtk01u?=
 =?us-ascii?Q?GCyT1Obz8g9aG6xiF4Cb3amwzPnb9BvCEt+iSD5Z8vWtFetewyRq7cle5Eif?=
 =?us-ascii?Q?2uGhipyekbPAi7GfqJbHz03HsxFU8hJgLPXmTs6b0tzPXPjKxI9ZqURJeg+O?=
 =?us-ascii?Q?8T58rGwt/46S4di9MH6sjSzcJ1u/PsyT4vk9rA97mpJmVDkbdZEqRuxPXm46?=
 =?us-ascii?Q?tkA2F/J7MzzqKUys0gdPhxhS?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79630e6c-109c-48ec-953a-08d9572ba3e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2021 09:38:39.2617
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +l3sAggNM1gMZ6Nk+tc2eFClpllRFrjbDtfoVKt96/DX475ZfWsv92/fsG2gBMedmKNgBSbyNtRQln5ueoMUfoCkPUWqw2ZQESJ5t7IW+5x79thSohjwuxnqPIyuz+Ud
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1552
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju-san,

> From: Biju Das, Sent: Wednesday, July 28, 2021 3:55 AM
>=20
> Document USB phy bindings for RZ/G2L SoC.
>=20
> RZ/G2L USB2.0 phy uses line ctrl register for OTG_ID pin changes. It uses
> a different OTG-BC interrupt bit for device recognition. Apart from this,
> the PHY reset is controlled by USBPHY control IP and Document reset is a
> required property.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

