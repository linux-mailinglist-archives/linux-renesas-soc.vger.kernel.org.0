Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC779C46BA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2019 06:49:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727101AbfJBEti (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Oct 2019 00:49:38 -0400
Received: from mail-eopbgr1400118.outbound.protection.outlook.com ([40.107.140.118]:47424
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726231AbfJBEth (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Oct 2019 00:49:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QIlmoU2iccOoMkpJsR8c74iOwFbBqTgXVaV+d7hQyXVOGmbR3ouVrHv0zbaIr08sLQ3NzZbUopzP0dPa8K58lHye+rR3Ai+L5ORaFxcZZjvSD/y4acJvMVNxqOawn6dO2C1equgX+BTNmqiNr3kWkEOxKB/f1WwbhTT/QDhOzHMTslLgMcWluBR5q1yT7GnHYJl470CWeHnLxdD6dPP+Y2xUKK3vBA/uStp7Y6r4JmyUq2tbyLfjYSHAdzYHfAq07sdVrEUlxWC2gODHMNH9Okmc7doXsPGjCxL+dkIu5SLo45SjIojG3Q7iJpHWk3nfWgUbSm/MtyGbT8CeHJ9YPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7GseWl8AaXq3yPNTPwLj1JuJ9IRLySsFdaiTLa4B4c=;
 b=Pb9WMb917DQM8VZuR9yrxjSD5AcydmQ1UpzeRSuJXpnlMiSmUYf+9hLevgoNWYgw437hAr96uua1sfd1LNPklRH52LkB12tpw54pR4RVPFDl7UtBAvSsp/RUNx+YkHoXM6DKfbYwR7gXnxW1ZTASWKgA7GDDs3Imrs7fPwpM210pNKfuUUIYhRYZKVgG0RP1SqXeR2dpf6AKf8Y52Fn5pwLbMpLCQqVEiC1QL53hU4Uc4PefPVb64zUHgv0KqnhX0GCrgd/S/AF4ckyzL/zUBoxt/aNKr9bXfvjz2Jehx8ZUHUDUSG5GClhUJoyf9YDZKp93FYp9r7Rvvh/djiXnNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7GseWl8AaXq3yPNTPwLj1JuJ9IRLySsFdaiTLa4B4c=;
 b=PjFi16BK08Gejutv6PmvkYSnRxXa9zpgt+eyZ5HkiRtbEmKn9n5984N56pwQAqogJ+Q/yCcH9v77gNs/O1x6j9hHkV2I1ZnE912NEXLwXQd2q1AzCEW7CoSep8TiISGU2RTzMuvpDBk3/NvPg8MyFjfSUtprz4p9YvToddeFNwU=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB4880.jpnprd01.prod.outlook.com (20.179.186.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 04:49:35 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::548:32de:c810:1947]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::548:32de:c810:1947%4]) with mapi id 15.20.2305.022; Wed, 2 Oct 2019
 04:49:35 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     Stephen Boyd <swboyd@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] mmc: renesas_sdhi: Do not use platform_get_irq() to count
 interrupts
Thread-Topic: [PATCH] mmc: renesas_sdhi: Do not use platform_get_irq() to
 count interrupts
Thread-Index: AQHVeIMLN5HU2GHo9kekpvJ1Bcnq5qdGxg5w
Date:   Wed, 2 Oct 2019 04:49:35 +0000
Message-ID: <TYAPR01MB45447ABA9739F32FB2F672DBD89C0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <20191001180703.910-1-geert+renesas@glider.be>
In-Reply-To: <20191001180703.910-1-geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e7435786-d7d5-42cf-b000-08d746f3ec6f
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: TYAPR01MB4880:
x-microsoft-antispam-prvs: <TYAPR01MB488048693AAB24F6034F980CD89C0@TYAPR01MB4880.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(376002)(346002)(366004)(136003)(396003)(39860400002)(199004)(189003)(14454004)(229853002)(81156014)(476003)(86362001)(76176011)(8936002)(7696005)(8676002)(2906002)(186003)(66066001)(486006)(6506007)(14444005)(33656002)(102836004)(6246003)(26005)(256004)(11346002)(99286004)(446003)(6436002)(305945005)(54906003)(52536014)(9686003)(4744005)(5660300002)(74316002)(55016002)(7736002)(6116002)(71190400001)(81166006)(71200400001)(66946007)(66556008)(25786009)(64756008)(66476007)(66446008)(478600001)(4326008)(110136005)(3846002)(316002)(76116006);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB4880;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: losq3/r8csWK0AcZUtf+l2eoI3WmIMN3N70wJSOmsja7gkD9A007DClnMQ4g0ouhVxBdAlOsvPFA5Mk94SvRh8Q9FP9VII87WXxHEkVBt7MJyR/nQcAOIIA3XhLUcqosTcIEVHjA1lljMVkeoSfstz1oxQ/pJU1x97C2JsigSVLJ21taDpfSa/stqEUZELtVcPaQQScKyjQ6RtDYJpXUhQx1Hpi8iVmCjjmeNGRgPYMlnY9cIpARP4cGbWrGxcxN9UwpuqBrtHO3dKOKzFBWtDd9rXv1IfJdEXWlXt3qg3LDwIC4tLDHhp8qQ5s11izRGW0Q0Q6ErJsdlnpQW/dFWOHR12m/VSHd44vl8HnHNGiXk6GxsJNfAQJBuTPb8Dpz9myBE/jmvjkAGzWPUqCueBdYkGJCCrzY64v14qjxELQ=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7435786-d7d5-42cf-b000-08d746f3ec6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 04:49:35.2884
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d3MALD9nkjXO5EkxQaPa27wiM6UM/FhWVQ4mcxxrRLIr2GEZp/r09I/WYNljZ94LNFbRUhBq5LLMnzcDlf6Pp4Pq0CkR/Dnfwpdd18eXI2J3zOXCBiCvXs1EQaiLxZvW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4880
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Wednesday, October 2, 2019 3:07 AM
>=20
> As platform_get_irq() now prints an error when the interrupt does not
> exist, counting interrupts by looping until failure causes the printing
> of scary messages like:
>=20
>     renesas_sdhi_internal_dmac ee140000.sd: IRQ index 1 not found
>=20
> Fix this by using the platform_irq_count() helper to avoid touching
> non-existent interrupts.
>=20
> Fixes: 7723f4c5ecdb8d83 ("driver core: platform: Add an error message to =
platform_get_irq*()")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This is a fix for v5.4-rc1.
> ---

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

And, I tested this patch on R-Car H3. So,

Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

