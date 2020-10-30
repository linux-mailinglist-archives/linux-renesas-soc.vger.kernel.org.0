Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBC8F2A061A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Oct 2020 14:02:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726355AbgJ3NCK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Oct 2020 09:02:10 -0400
Received: from mail-eopbgr1310091.outbound.protection.outlook.com ([40.107.131.91]:27424
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726178AbgJ3NCJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Oct 2020 09:02:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GEXBCIxbLTbtHykdqshsZEvcqJmW9con1dFmpp3VQ7gjCQ8WwwJaOPNNv47aPeUATJy1MaWE74twrvcaC/e7AE4YNNDUGfd9NILdQ1ZO6xXVumqgT0rWh8smZatm5zVDXWAkBa38y1J19ITBCMwtvX7+4Zq8HZtajHWd9YM8Q74D0QkADVygTR9EoktStD4JghBEcWs5pHZmkD2jG+fOi/XNy2eN85OREdlx3pBtzZyHqdnxyKXjDV0NiYd1Q+63+2ChpcxsVgbEprcqZxjmypRRNCECNJWX14SDYu58vJNLk1dCog2BoE986QmFI8wPQCgTW0jUfk3bQHCjVZ1Ucw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tuz6n2ay/uh3o5VgWKORPoVZzeA8bvUHNd1PNpmk5h8=;
 b=ZKsbVOOh0KlWiNIQcu/T+P/T3v6j7yjqv4lSSthkzIvzwPG01+U9BwUfKt2DJwhDA+gJjdSMJ/4id8YcYRKAHgUBOnmipti7i4xAPFc8TkHzsImctbM7R7Fp3wJvHW5xb0pjUHbYKnFZ1CFEyVSvhjWFx7MvmE+x8VBnUwfaoEfzEQ5rXJkd/ZaVX5UNpDWhJ1T+Zk79eFdTeKUnN8KB10gyKo7NOfTF/Utfe5M1//AtHFE6FKP3O3L5AQHvtQkz6ws+Q+QYQxZEWZoar2+m45NcFksTRqzu0lAJ/ddGVZF9/XzKpxncXr0mUldyXkvwm0gVF+bjStHKnHLLtRzaBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tuz6n2ay/uh3o5VgWKORPoVZzeA8bvUHNd1PNpmk5h8=;
 b=LPZ1X8grX0KgI4WR75iOw07nOyVWtgTz0wK/v4sNj8Cu8IAcBxD2+zuJz3BDTnt0wj0NZnNnQRIG45wZFyHF3R1PPwsq6VyyDIOegMA0c5JuSp5CrJ09jAmUVbzFAlenNhbmq0dWdgDOpM4RhRr7HfUkuVdxtQfeb90ZqlDBIHc=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB4025.jpnprd01.prod.outlook.com (2603:1096:404:d6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Fri, 30 Oct
 2020 13:02:02 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::bcba:dccf:7d4c:c883]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::bcba:dccf:7d4c:c883%4]) with mapi id 15.20.3477.028; Fri, 30 Oct 2020
 13:02:02 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>
CC:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH/RFC] mmc: core: disable power off notification when host
 is removed
Thread-Topic: [PATCH/RFC] mmc: core: disable power off notification when host
 is removed
Thread-Index: AQHWoUNC6tSZ/elwUUidYVOSVqoT96mwNceA
Date:   Fri, 30 Oct 2020 13:02:02 +0000
Message-ID: <TY2PR01MB3692EB14470C517E771746E0D8150@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1602581312-23607-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1602581312-23607-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:1d1:f583:fc3b:d64f]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5d73255a-39c3-4198-ea04-08d87cd3feaa
x-ms-traffictypediagnostic: TY2PR01MB4025:
x-microsoft-antispam-prvs: <TY2PR01MB4025AE62EB35B08731CDF7CDD8150@TY2PR01MB4025.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kJ8t9u6j0C+vSTXzDgr2YdyCB0qhBA41KyKJLkE3Zr9kOVwaKazucOk36lykcpA0b6ewz8uBusuodQo4+v7ime+pHak/eSArm7q8OOEwWwKPcBhi/w2vmEITwAF+HK7G0dLou3GxrCtTGouoP13XvrwR7oek817z/014WEKWhYgyseMUQ4Hek9yZf9+pVNCCWxjACSyyDqm+vKHqh9ve54tH9TovTJrTgCrV3SXwDgB+6KrQveu/WCnzE6CfcXCaMjCXFrgc3ynIP/OpYO2+ytXe+j+mHW5xHraHCRBYdPdukLeATXFYwbst2/q2D+3Bo2ZgtYZv57gnAmBybMuyRA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(39860400002)(376002)(396003)(136003)(8676002)(52536014)(478600001)(316002)(8936002)(9686003)(66476007)(33656002)(76116006)(66556008)(54906003)(83380400001)(6506007)(15650500001)(64756008)(66446008)(6916009)(66946007)(71200400001)(86362001)(7696005)(5660300002)(55016002)(4744005)(186003)(2906002)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: tUhOk2p/8Rjclt0fEWbfH8msVLEOT/pwYMvqw5yQwpvaNT4BDOzlj4KbcI8oVbWxKtJX4lvTLkyuUBgfq0buTzoc6+znXnGhxERaz/PYzwab7zWIxDfoS8sLIR7HcH9NBH/gvTTrUU0ubjo2ek/GIGU6KDAfMmH0CpmsG5linshA7ZYZXkIbZRvW0aLanwWbIekoihRZm9NkhswRJOmRcqCvGjrRD4IcbfIStzudOXklB++zGe8peq1f4uxsZLiv/VwJfylt27TT/O95NevfAbZNzg89P/Wu9ttLohKkykYI9eshmiMc85096l1FyzUqHuADpGUT99g5xEgMfEWjybicbK9OvHAoz385c2yRmj4N5gYFzpM6aJct1+MBZeW/RdCLuoMDlInb3vDPTJN1pWCXpJVWhGW4Zveqo9PY49lg3J7CyX6yCCVkWr7QyOYfBWmAbDON55Ca5KF7Zh2fjP5dnFR5fKKiQwtDe9dwGIsCd+WTcTae0X4qPTNLGJkv/O7cJEh53F6L19e8fuIs1tCmxnpD7CLEm2adoiYJMt2t8qPwsqB5FdGA9bpxpgfTj5LjAmDu9wJ8nYAQjGEQ4fK+ZVbz3Y1hCvQda4S38vX87yAWcgBVX8MC4KOvkBBH+gXo/uIUlu0QU06INDBHvCnwY6RuxOZ9peVr+T+/evpKG9Juogc3yAOwmI6Hvr2LgrTcKhyvEM59UnEg/dpCSg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d73255a-39c3-4198-ea04-08d87cd3feaa
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2020 13:02:02.4803
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k3XI+7z3SEoICJ6s7O4n3y4D4C7LfkgNjR/dmDb8qFvo9TuViWZD81cVhl7z6vUI/sr3T/m4bqTVLxrMVkLmXBqiuFH4NZRgQrCH9Y4FQ0u2Z1qRXavoKV/AjbfC9JmI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4025
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Ulf,

> From: Yoshihiro Shimoda, Sent: Tuesday, October 13, 2020 6:29 PM
>=20
> User is possible to turn the power off after a host was removed.
> So, disable the power off notification when a host is removed.
>=20
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  This topic was discussed in a few month ago [1], and now I could make
>  a patch for unbinding the mmc host. I'm not sure this is a correct way
>  so that I marked RFC.

I would like to drop this patch because my colleague found an issue after
he applied this patch. The issue is the following timeout happened if
we unbind a host controller right after system suspend because
the _mmc_resume() was not called.

	mmc0: Power Off Notification timed out, 100

I'll make v2 patch in next week.

Best regards,
Yoshihiro Shimoda

