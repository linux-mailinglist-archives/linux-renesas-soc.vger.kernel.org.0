Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B55C621B4AC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2020 14:06:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbgGJMGx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Jul 2020 08:06:53 -0400
Received: from mail-eopbgr1410125.outbound.protection.outlook.com ([40.107.141.125]:6170
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726828AbgGJMGx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Jul 2020 08:06:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g4SmY6kkbxkbL+pb8GekuxQmyrCKO6lpvC1tlCECnIb8n7osqZFVSRIcvHXZEWolYrP1pdWN8wqnjr9romisdEAuC0ocEdBe7VLONU/YmubuZrlLvjv+Iia6V+rsYcsT4NdaPmAtj8ZNlMra5GCIFdnodUpUb2eUPHo7LMxDjs4skJYYlLlhKWtyDH/3vnW3juzcrOXztpB1aLPRTsUS3W/xdhN5wPmredQ0fXfv70/7XPElmbXg4LRGkwKlH7UqQPv3tIY5Qu+Dc2IOXsjrgNsnSQapcLPmXnaMoUbY+kDyLlw/pwjznNu/4x7BatmVig8HStWE1HIqOLXD8vnsRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DDVtpj3i37Y15i8uSgOw02X6rlO5PLXBqaNcuC+Ytc=;
 b=mn+IXMfaVWkkHLx44smd6y5z4HhkX2cAiQPLtZGdzCUh5jegk2WkoFopqlKC7CV321T8Qn+weXTPM3FIVzlFWQ/MQxvZyDgmcpHRVmlogW+Pu+8ha6zhpEEwsPF70OMOwxz+8BAe6SmdZ3spTHVBBumBBCYUS2i9ZKh80E0zDT8AyNxD+CsHa+LbscL0jc9AUXardi2ziknmpAjESiOwnZqS1QePJPaA+A15GMU8GaaNdb76diIS1DTkybyt1eyA+LCymgxjjmZXp5uIRPB7oZBzqrwm1iYdQcwFLyOF/Anc+KclUp7w08+QAYK/sEHvjyY5FdfITMfaLr4btCCFMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DDVtpj3i37Y15i8uSgOw02X6rlO5PLXBqaNcuC+Ytc=;
 b=jp6vHpkm0tBQJ/BMgTylGXoks09CtZt3vDSVNxwzMuz7Bc+F/UkWgviA31Xtq5j3cKoiqO6PyBdC8Jg85JPGmaY7dzaLt9PNihNhlZ/eThPWNVYkuiy6z7iyxlb0nf9UZmK0uBUN7ZNGrrzyWcogL3Ad2hRvxCvFVBAKuIMXNaU=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB4671.jpnprd01.prod.outlook.com (2603:1096:404:126::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Fri, 10 Jul
 2020 12:06:50 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3%6]) with mapi id 15.20.3174.021; Fri, 10 Jul 2020
 12:06:50 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     "geert+renesas@glider.be" <geert+renesas@glider.be>,
        "magnus.damm@gmail.com" <magnus.damm@gmail.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [/home/shimoda/make_patches/renesas/2020-07-10-fix-arm-mmc-name/]
  ARM: dts: shmobile: Fix SD Card/eMMC interface device node names
Thread-Topic: [/home/shimoda/make_patches/renesas/2020-07-10-fix-arm-mmc-name/]  ARM: dts:
 shmobile: Fix SD Card/eMMC interface device node names
Thread-Index: AQHWVrJAtfcfc4jJQE2VfxshynRbfakAt17w
Date:   Fri, 10 Jul 2020 12:06:49 +0000
Message-ID: <TY2PR01MB36925A6C0C81EA7FAAAC84DCD8650@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1594382652-13759-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1594382652-13759-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: glider.be; dkim=none (message not signed)
 header.d=none;glider.be; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:2caa:87d1:1aa8:5e97]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 597d9fbc-d484-48db-84ca-08d824c9ba06
x-ms-traffictypediagnostic: TYAPR01MB4671:
x-microsoft-antispam-prvs: <TYAPR01MB4671FEA772B75BC41D07CD99D8650@TYAPR01MB4671.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uRlay/Yk8p786f1kGtLEz/X1CH9xACJNKEGTO/XajTbnYSjb6LxaBRf9r/YPO9QsWHV2Qb0dlKBwL3BTQ0jjqgT13NtFu0hbZYWcq+2LlwRdM1wBVblcmnwp29EUfCUh0mnfBN/8qq6wNmM2Sj5WVx9i2WHCsPDeCyVlkvDgxA7gUUNQl4JrDTTom8n6P5yEA8QBpPK4FvVBgOG++Q+e7FtDqaU8hsvsJaq9NfZvoWVh/gSnMDvZkykVxT4Fh+DbTodg9oP2aAzk1LnABwJ9s9AM7b7Om9KxsNLNjwH0ERF4+ruyvn+W0KBZOUkDQAJ6zPbnmN21pFeiRB8/bOu25g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(346002)(376002)(39860400002)(366004)(136003)(64756008)(2906002)(66476007)(478600001)(66946007)(66556008)(76116006)(33656002)(8676002)(7696005)(71200400001)(52536014)(4326008)(6506007)(186003)(53546011)(4744005)(5660300002)(9686003)(66446008)(8936002)(55016002)(110136005)(316002)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: yfMN6TjLg1q+sTN7spafbKau8931/cDtj+cpPX2WfUgTRjd9sSKmu9X7cE15PHUPeOi1xDk0DNq3gWNhNiXrt0c3ZQC9yuVxUkepm8a6IUDiHan1CsSApP+iEyIfy8bjJYanY5dp8sIZdtoGort71DSSbvkmyCXzVgZIRvghk1wtB3zTWPrgq5p2czLqdhXaAwbG130IGNMeGDh9jx/xulXWEgwK+JXeXB7QjJhpVyBwNvkFbT0LdhBtoMv5dVqSJaF1w4OGU8azTDsA61RdVgcEvEQOEatL0spDxYijWT7dSlEGXRzeZIWVIWsJHYZM4rIp5AKW6X9GwVa5h6yUY8dGzEnhFXKdNLB4tleTJe2wqEh+kYlWB5ZvfQnxviBQ0nWFXKJasKjXp4thNdNWDi19xBX251N2XxajoO/y6ap1FFvinjorBfJPb2WGGecP7PV+KjEoWLppU8tNAReokz/HxIRzMbuynFuvgSeMqy4yLmCFyVaPT/+9f8x/zmWYsYiBTyp3I1OXrEfv8DHTiWu4UDh3k+8KIob/s7l2OJM=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 597d9fbc-d484-48db-84ca-08d824c9ba06
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2020 12:06:49.9721
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z7ao478H3P6fJ8NXkE8XJp5b6Q79ewCJ3Q+iVvKa58i7Qy23bXcPu89bdmLR1hvyuAvzqXLw1L5fK+4JEZ21SYOEBmYe0OJ5A3lEECwYSNFvMidbAsor264XfBddfO14
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4671
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Yoshihiro Shimoda, Sent: Friday, July 10, 2020 9:04 PM
> Subject: [/home/shimoda/make_patches/renesas/2020-07-10-fix-arm-mmc-name/=
] ARM: dts: shmobile: Fix SD Card/eMMC interface
> device node names

Oops, I completely mistook to generate this patch of the subject...
I'll resend soon.

Best regards,
Yoshihiro Shimoda

