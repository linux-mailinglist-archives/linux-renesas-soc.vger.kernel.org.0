Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96B862553CD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Aug 2020 06:31:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbgH1Ebz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Aug 2020 00:31:55 -0400
Received: from mail-eopbgr1300123.outbound.protection.outlook.com ([40.107.130.123]:28473
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725969AbgH1Eby (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Aug 2020 00:31:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WpVrsb75jemsD1fJcNks+jgn+nU3RI+bcp/WsihD3iIeJ/tJwL/6xKPCIEiIGvMXkiLh4XmQY2yOyVc/NgEfl2I5B0RAPVA3+gjQAw3ChvLMhv76YTqS0OuRgYBQgqe8LR+cJQZ6zwixZ6WwTiMdmzZxnxBtV49Uhv6iBYcpSFk8rDzbVX0/8LT3LYHrDqrRY7fKqyURheO1YIDT9yM3tnCG/JSAl3Wo6nJSrgKB494f+Oe6+EhjuR+dPdsRktmex4z5avECfbBqZlIIXqqAcvAI2BYxzi4x4qO1meIol7AgYyrUVsKrKAYwJcj3tF6xe3xReG4Ns8CqJQIqO1X4ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JKKMNrDk1n2Jyfi4pZho8iH3Zz3L1p2GoXZLZXjWz+w=;
 b=AMQLviC7yZHqkOFI4D7a+Zso7Nm5HxF2dWQVKrhhQmiTqrZfxYYo1DcrfZwfEdUvkyG6qL+ML+fDkqa3VcZFN+gDrNURIJs0sLa9/8ZNDHItKtM71kRz64b0aZGJIdJ7Y4t62ewx4hD6buHPVPr7Q9cqUSJy49aszqY0YEBD6/ARJuYJOC34g6w/6CRSwW54FxY1WsO0vE2D47mlRNA9QjCECaM8cbSPLC7j91RrG+3oMMCHeboOtz2YOhGVVYIizkxmSVSH8GBbOK9tq2fy5eomguDijoe0DRsLP9/H1J2B9gpkEX5PTBlDgWbx5tguyfReyBAUNizo7Su+S0R5fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JKKMNrDk1n2Jyfi4pZho8iH3Zz3L1p2GoXZLZXjWz+w=;
 b=jLd8gsrjp4gzUhIHJbtKxrwHX09KIwepaFaKIMi9p6vTzqiRZ4b3yTiF10i5MTEvTUWJM3Ntckexd5S4C8ufLVX5If6+jnSaUemRuG4/PgGn8J7wlth5S7il1RF3dABHnQLcgi8TDoEK4S6v0RI586MsjmRNTJYpmjzHmGBEvTQ=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB4507.jpnprd01.prod.outlook.com (2603:1096:404:10f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.22; Fri, 28 Aug
 2020 04:31:51 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3%6]) with mapi id 15.20.3305.032; Fri, 28 Aug 2020
 04:31:51 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        =?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: RE: [RFT 5/6] mmc: tmio: don't reset whole IP core when tuning fails
Thread-Topic: [RFT 5/6] mmc: tmio: don't reset whole IP core when tuning fails
Thread-Index: AQHWdvVvCAc8IT1iqE2YYA/x12t15alM+WbQ
Date:   Fri, 28 Aug 2020 04:31:51 +0000
Message-ID: <TY2PR01MB3692ADAE1D5003175B74FA28D8520@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20200820132538.24758-1-wsa+renesas@sang-engineering.com>
 <20200820132538.24758-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200820132538.24758-6-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:b16e:b7b1:d350:3c9a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6d130eed-92c4-4137-f97c-08d84b0b491e
x-ms-traffictypediagnostic: TY2PR01MB4507:
x-microsoft-antispam-prvs: <TY2PR01MB4507318F7ADB1CF6B5185B86D8520@TY2PR01MB4507.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2ON/qPIeLFCzNilN3t/XgEIOnTnG7/UkY7JxDOLRSHe1CVLhdP4d9NWWtCKUCHZMvkovHvygh88w4qBEdWKTzzcJ1+phvptke4JyxdmLdUYJxU+Js1ob+UxyTd+rshv6rImfr0vYIAlK5HlBYE4MzEF1j6Ho8UmZ80CiotJQOwxc8Rb/uLrfVJh96eabvL4X518jSEiryIC1de1a/fcI+mnXa+LsH8bj1nWuYi04DuSfhQ6jZUMJ1ZwRW+8A90phHBzbUfqWFrbI1GkdRz9Nv73BV+Ks/LO5q8f7QamnXo31HNdD5xlvq4A6/pIF21zl25iVnxST+9pU48fa/9EesA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(478600001)(86362001)(110136005)(316002)(8936002)(54906003)(33656002)(7696005)(4326008)(8676002)(9686003)(2906002)(55016002)(5660300002)(4744005)(6506007)(52536014)(186003)(71200400001)(66556008)(64756008)(66446008)(66476007)(76116006)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: VQkuLZuQxebGGbcOagiws5kG7jgWq/RcNHR3fCQvPLN2Iu/1RHbI6k2QN3tgJt5aD4G/7Figbx9HMw8Q1+UlpxXjEWfweN1E4a/nGZc6VJZM859gASZy2F1TICgl/B8AUTAu9c3ls+7xLnD0RPXCDvPrv4LX01yyoBtSabNef04iA5NIO5nJ6e7O1Bs8RT0iPHmOeoPjaqMuu1XuGtDKyjI1vrNTt7kOlXi15+v4JkYii1K84E9KVhBGmm7LEZjAua0AXrx/CaF5ytDi/CkuliBtST4WAovE1w3MNXe+SBmgryk0mY4HRhq8YzUxtPDN9ipjlU3wWE0y8O8Zq584T4pfKmeu1hlscjC2+kk8W9JX61mKDjppiIdMXDfJX8KKwZ9pyKi/36KGwSlEDF8UirR5Iv3InpcPkoqGlInlkR3t/xGxqptlbOc6g2EaoX6qgezVmLh5mfOif7fS1H2VoNAECoEWnzYlKNjXXotumaiQr7oBTs+AsdMGj4dt+e25MTtuAkgwohXz2zEgd46UC4fFRg6MNl3FMys3mAjKZwel8a/ADs6mglIrecLGKWSPVtR5MH5wlaAU6ztBoJxxmrgZvc6DzKcxn1pQXwf7i4DXMJSGwO2dfM7/vNytjXmClb1SYi9gDLQ5eEiXo+zpVKN6v0OxB+mygJZ2sgGZIhd6oCnDlASz8+9/Pfg96/AWJYabBXZqGhfiVHUByluQWA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d130eed-92c4-4137-f97c-08d84b0b491e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2020 04:31:51.4896
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w2YZ5NVDS2OnvgDVxbJyFl2TJk72LBQVGZFK9zVDaCAlZQc3O+SMXsvU3ek/PyPaQpxsSun9HLJUwd3TA/HYBNYl6Jk9uOt3sX+S7dNWovli6yF+Uf1BhiyJTb3UqSm4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4507
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Thursday, August 20, 2020 10:26 PM
>=20
> SDHI needs to reset the SCC only, not the whole IP core. So, if tuning
> fails, don't handle specifics in the generic TMIO core, but in the
> specific drivers. For SDHI, we need to move around the reset routine a
> bit. It is not modified.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

