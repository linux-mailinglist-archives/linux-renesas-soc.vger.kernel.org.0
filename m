Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1E2C2553C7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Aug 2020 06:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725911AbgH1Ebi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Aug 2020 00:31:38 -0400
Received: from mail-eopbgr1300120.outbound.protection.outlook.com ([40.107.130.120]:63664
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725858AbgH1Ebh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Aug 2020 00:31:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h9/oYWBPG7WXMHXL6qUUOnGMz344x6A2GEZuAcliaZb5lU8kdyznIh/UlemdyvJk5bAVCHtEp9gncsEvJpciDjLn5I5+G3kWt2I6ykfV/wKLMu1wR5GGMFlvM9mnW4n9N14Tz/2rpqpRPP7xJCj6Rkwj7X2L5UiLDAGR6SttFESMrYfmnOa5/ZNQHStBIv6tEnV+8DndbYWccjiGLa9sWhsYx9rVZcGbllqbv+KqLv+KbpEHGYBQVDmUFehcCrxohb2mLxG68w2Eyb0oZObAhqSp/CR90NceCZTsnhGBpO8oMUJP0LNYDpxerpsQwRenLoYG3U4GlU/wV6YzZGiIjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=baIdj3DgFGokhDdjFKIhclqiLCyzZqsFgzD2BD6kp9U=;
 b=gJbyFqpA0bFGpDFNaYxEql6YGwO6rsxNTqLBqPbitY78GUOd1YmtJ2abNTOPeazpK3CbgiKxnQ3O8NQyzby91Qru/k7kh7fdLlUoXitFFzRIOmAUsKBfDRurfw9jU9wyIU7HIVggI5iD9xWdpLN65jwPW6A9PSN6vzCgfoEkAViv/WN4/rw4Cn0cV0C8ZA+DpkTzbKQUuccGaHmnxllZoXAf03ExdWMpmnuvVPdHrU+5sj0xBcHCiAry3E/EJg2exlscoc2BfkuQE9rjB5YIjt0o2nZGhsRGTECGetfdrQb0YEssPeagp0I6ivcEXPetzMnuYkly/gF/4S9SW5p3Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=baIdj3DgFGokhDdjFKIhclqiLCyzZqsFgzD2BD6kp9U=;
 b=Qg0wH/6hvfGAGTyPzKoOVm6AAyoZg/YGn0KeTfrRgOIhzNhZ4lZaH0QioW19fTipi9NuzUFy5nGTcyWHO8aqEpmCSr5sg//423iVlhsVw1qqytGiDSdtTMx6oVUj9aR2+0d/fF2oaGMDLK+9O6jv+9sigFS62pQ77GshQs7z6us=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB4507.jpnprd01.prod.outlook.com (2603:1096:404:10f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.22; Fri, 28 Aug
 2020 04:31:33 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3%6]) with mapi id 15.20.3305.032; Fri, 28 Aug 2020
 04:31:33 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        =?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: RE: [RFT 2/6] Revert "mmc: tmio: fix reset operation"
Thread-Topic: [RFT 2/6] Revert "mmc: tmio: fix reset operation"
Thread-Index: AQHWdvVumGlrer1As0G3MnY+5YTxhqlM+N5w
Date:   Fri, 28 Aug 2020 04:31:33 +0000
Message-ID: <TY2PR01MB36923CD50A5648F7E63D9865D8520@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20200820132538.24758-1-wsa+renesas@sang-engineering.com>
 <20200820132538.24758-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200820132538.24758-3-wsa+renesas@sang-engineering.com>
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
x-ms-office365-filtering-correlation-id: 000c2aba-faa6-4b6c-5d91-08d84b0b3e6c
x-ms-traffictypediagnostic: TY2PR01MB4507:
x-microsoft-antispam-prvs: <TY2PR01MB4507FED7D01C86937055B306D8520@TY2PR01MB4507.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aheLXdRchT3wus+6WLoLJeSKExh4mIka3fOUplkOqPdoOAjOYeMoq5GwGkKubY5vjZfUIjk93BWij19TGDx3maPz8P6QXnynI4lZkx5iI3fAJnmV5V5vCwyDGuZ0LMW+u5+aW6etTgrTbE0TDAudIlJQRYX/vQRl6OrU0n0s/cMMykyJ+0saTzwb5M+sVR0AzFNJZvi1MqAunQ2RlDryuvPWrKoXWGiS3OoF4tYGnO8RDA49ydJQw4mJFRGjqbJyg0vlcHdW7EwKM+LhowoJizyeuIeaKXAIXe+oxjCJ/nEBiChu2wlzM0rYBcGJey0/XnhNNACdBKLiFUsy1MYgeg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(478600001)(86362001)(110136005)(316002)(8936002)(54906003)(33656002)(7696005)(4326008)(8676002)(9686003)(2906002)(55016002)(5660300002)(4744005)(6506007)(52536014)(186003)(71200400001)(66556008)(64756008)(66446008)(66476007)(76116006)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: yU8rJunQ3G6UsFLAZ5clleHosIPOl2XxhETRNKH9Myjkw1q7IeikW2NgxWwHyoMqmtXycxXf5kKTuyPE3K/j0zYr0XMX7ohg240R1ForNXIZqIhoDPtoz6nOF5XI6zodsYyo2i16Vh4OFcQdPI/Po2zM5Hj6Yt86+2HK3iKUzx27HQF/jrJ2sr38Xb934aP6guuWvz5D2RJ4xKzLSnWwm0j3BB/zgnvQtXevK5BAvA6zH2MtN/9+T2HisS7ZmjOzNaA+cePKC9u6Vw3W0ndjZ/TZIc0ClEuJnSPafsTxUQB5tIOvGM88gMz4ddNVRapGA5+CN/Rh9dUfoM2VhLL6auP+0SffjrYZ+DeLtAmfRQI8wMla8cYY+qRS6LQcL+L/YyxjheGOXrL/IR77MAcXOJ+mWUj/F/1QJppca7Z8Xw9TFari/2KSdVKWorBb6xOwrJ4OOhWZwMdC08pNTf3N2D5BWDI3KVUwwIwh9l2PSR6cGWNsvaEIQfXescBdM0UndommV11DZhk/Yh2UJ5YleHPEm6/W4QWuRS7WA1i5DSW2mbueHRIkkmtVL1cjTpNmxJWy+446cDc1eZLiIL8SEgvZKudpacw7ducvRW2ubBQfBepBF7yCbSZldgrAt6Aq0L+ssnxNTYXatHoVQKKHVB5EJ812tb6wyPaex4BO9C5aGumddXPYkdvv/MvdeEKO2efxYGW9WmZntho5IjXjSw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 000c2aba-faa6-4b6c-5d91-08d84b0b3e6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2020 04:31:33.5638
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K74p4X9HVbu5MZrM5hwxZ9Z9IxeFCleTBtq27haCduHjgPJQUyipEYcuAn6K87LF6bhcrX6e+6QLXsj2jnnVFRwq3V/5+eXwHihvch6uWrqcUzCdmf+Cp+prNVtor6DR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4507
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Thursday, August 20, 2020 10:26 PM
>=20
> This reverts commit a87852c6b8827b7fece78ae57d871d56e4348e30. It did fix
> the issue, but was building on top of already wrong assumptions. The
> driver missed that 'hw_reset' was only for resetting remote HW (card)
> and not for the IP core. Since we fixed that in a previous patch, we can
> now remove this patch to make it clear that 'reset' is for resetting the
> IP core only. Also, cancelling DMA will only be called when actually
> needed again. It will also allow for further cleanups and better
> readability. Note that in addition to the revert, the call in
> 'tmio_mmc_execute_tuning' will be converted, too, to maintain the
> current behaviour.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

