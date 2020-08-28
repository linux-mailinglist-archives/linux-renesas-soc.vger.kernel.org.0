Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EA752553C9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Aug 2020 06:31:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725969AbgH1Ebq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Aug 2020 00:31:46 -0400
Received: from mail-eopbgr1300100.outbound.protection.outlook.com ([40.107.130.100]:35456
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725858AbgH1Ebp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Aug 2020 00:31:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gjlz2zqqIYxcHCxjkKB8ngX86lYAV+N+iKKziMTLX3Qaa+we0QMlsai/bbqRBjwUhKurkboVsTUwSEmY8rEue0R7njSr0IHe5Y77ZeVu+LK8a+XBxK+2n7tOiv2/oAS665QPWwsgNrt/2ic3Augw0+4hYX+TJo0/Fu8SvVRX0jkZWNHCuqsPDwk4q0g/NLTKVyxGIxK3C+YqrazMdnQIKZxeN1O8LWDlyK5oYN3+YpFZQpbt/I1HUYqdk7AQgRt6YKa4YeDsIMGOCocgBCPfXYjALUs06oRHhl7ZHW6wrWZWx50+23g4bT0bwMRmzYOA1+acif5ZnHic+jnftgMFfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOHroWObjiuyWwcNiCrIUnC+debwmJ8UzV8z0YIBX8I=;
 b=iGnjykumvTXOPVpm0UBBvwoymPRpbAXEoq7bEkKFK+xYREFQGPhkqEN96nW7ZL7ZVw/sbdYoJLROc8/kiKfRcPGAwr+mXnW9Z7YgbqL+cOK34wkR9KqloaRKM1q7DMWSGtgkZpc8c5VjyOtFRvyziRXX4g9LnCQnxcT/ZHxFBQI3m/yB/5kfihjM4ulctEvxDsLhru68GV8BIqzJCaN882aV0Rd1xnla1rf36BLqxAcdHriwEcuVLghH4nwOJ+WjWYyK7p05129LAVIAC2V8CTi8ff8/GWCwpMch+d0Efy+I9dmn+fpa1CbUPamptanwHDotoYEEsiig8NKC1WindA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOHroWObjiuyWwcNiCrIUnC+debwmJ8UzV8z0YIBX8I=;
 b=Sa7ThbjcQmRzWbDUO/1GF3M9BmJwU0X3SVDe1WUH+Lk6P8594YHzyx47PjtzuTopwsGF29pm1BCSkChaaVZBI6U3+5dr9wWZYZFND29CtAHJn3eISgcTd3xm0lJpb+EpYU9o9haMAsSZz4GcixOKrRJf2vFVNt/KZKhb+IgQX3g=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB4507.jpnprd01.prod.outlook.com (2603:1096:404:10f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.22; Fri, 28 Aug
 2020 04:31:41 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3%6]) with mapi id 15.20.3305.032; Fri, 28 Aug 2020
 04:31:41 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        =?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: RE: [RFT 3/6] mmc: tmio: remove indirection of 'hw_reset' callback
Thread-Topic: [RFT 3/6] mmc: tmio: remove indirection of 'hw_reset' callback
Thread-Index: AQHWdvVuaULHcXgblUiN2xd7IDeM+qlM+QNA
Date:   Fri, 28 Aug 2020 04:31:41 +0000
Message-ID: <TY2PR01MB36920ACD5E115E75EAC6CCCDD8520@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20200820132538.24758-1-wsa+renesas@sang-engineering.com>
 <20200820132538.24758-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200820132538.24758-4-wsa+renesas@sang-engineering.com>
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
x-ms-office365-filtering-correlation-id: 51e7fc1e-2fd7-456f-c120-08d84b0b434a
x-ms-traffictypediagnostic: TY2PR01MB4507:
x-microsoft-antispam-prvs: <TY2PR01MB4507E5D046824D722C76792CD8520@TY2PR01MB4507.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ONq1i7SdJRPIxFjBo0oeqoc3pr3MQUMgcYbhW3bjJv7Y1wtasE+muwsvh838uwW+OjaIiY1efl/BSwVb1/M6v2mCOoGRU8Dt83NDuwF1qPOLMD4v408ojP6U87JHjowy3HFqwnojFfJ0EF9+rVwGeu3qgGfvbxQQu2+uYDDdc0W+RlcUSs+6W2wkkqtjf1oBm2uUkW2cSs9jXtt11qVRbYM0DGM3uhlGvC6SM4Hxn/N3vKXqd5/9ccpbfeuAFeEB0MzPz0/62HIr5yo5xy/H4VPg5A6iOc9bGK+ftPaAiEnKNEc2tNLAiw1wRGkIH8kNAtXUHVpkdzhrvWZHbemC1g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(478600001)(86362001)(110136005)(316002)(8936002)(54906003)(33656002)(7696005)(4326008)(8676002)(9686003)(2906002)(55016002)(5660300002)(4744005)(6506007)(52536014)(186003)(71200400001)(66556008)(64756008)(66446008)(66476007)(76116006)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: Xtk9WhMtQLyeg1vn6TTuWXKMTb2grU/u0ePkOp/Vjv5TmR0doMaq+A18cJqRj87sxwBUq5GFtciKjygHUqM3thgneLACV4NRx+uVDyrYSXakhyPlAgj7mZC9NiHOp8ghWd2xrHYKwzLT8j6EuM/ViVDP1kIF3LPeQ3j4XoQW10AF2cAasFDnxI5lah9gafsomjvNU3A/fOBFGyfC9PDB+sF9QNh6ynwKuSycym5j8gc5ja2oyrxfTU0h9rT/IHC9pRYOf5cBoVbmVg7tUZ6AS/wJ7tjd1s0AGfbRsyX4qA0p150m8egQEjqolAipIQJz8HpX/jP8cu3/CmJN98sANo/6m8OYHml29bh1mgRjsB106k1Ro+fHyWhHjBIbHmAFaF1m3tBFTmn11iG17xGDMpOaSYbvptQ0+vEqwlKHoNok/7LyPD3qMNZ4eefP91Xk8PETywXfZcYdqE65Gr85ty9SPC6MSvyA3vaWIpSMVzIOvG6vCW3BspLSP2Y5nOmlYkVx2+X44CRvu/6aj0woJD/0S1BZXARw2SknNAmos+n9bf8OBrQ1Erdm8aEnbRFRUUzi6//dxm35PBwq3TCQSOKhcb7Xf/mNZz+9Rz3VK/EQhzEk6lhf0C34IiWvlzWG+tSuZPgKFLPRD4xHJc5/s4HT63AyYtGxWc6spDkiszUGW9OPeWoOjIrdABL5tx3qsxIKJ6dXpmRMb7Q/duqh7A==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51e7fc1e-2fd7-456f-c120-08d84b0b434a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2020 04:31:41.6952
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qgAhpF/qRTx8Gn77H/cWACy2Pt7vzRDKueW/qBEK+ZEtEBVnP7plktV641V8xnaSAzTa3UuGG81BmY8I8PYVPY8iEzBLUok0FWLPUP+ok7qyctpvaflBQNj+OOpvYYCO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4507
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Thursday, August 20, 2020 10:26 PM
>=20
> After Yamada-san's refactorization introducing 'tmio_mmc_host_alloc', we
> can populate mmc_ops directly and don't need a layer inbetween.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

