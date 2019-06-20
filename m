Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 699004CDE9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2019 14:44:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbfFTMo5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 20 Jun 2019 08:44:57 -0400
Received: from mail1.bemta25.messagelabs.com ([195.245.230.129]:13412 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726874AbfFTMo5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Jun 2019 08:44:57 -0400
Received: from [46.226.53.56] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-1.bemta.az-c.eu-west-1.aws.symcld.net id CD/B3-17220-5CF7B0D5; Thu, 20 Jun 2019 12:44:53 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrIJsWRWlGSWpSXmKPExsWSoc9jqXuknjv
  W4PZ5M4svc0+xWHy61s1ocf/rUUaLy7vmsFlsffmOyWLvofmMFn3n3B3YPaYdmM3u8f5GK7vH
  7I6ZrB53ru1h83i2cD2Lx+dNcgFsUayZeUn5FQmsGS/aDjAXTGWt2LzzMEsDYw9rFyMXB4vAC
  WaJOdPns4A4QgKTmCSevHzMDuHcZ5TYPeMdUxcjJwebgKHEvDfvGUFsEYEciVk3L4N1MAt8Z5
  JoXHYDyOHgEBZwkOieWA5R4yixoOcGE4RtJPH47Fc2EJtFQFVi9YKJ7CA2r0CsxOrG/2A1QgL
  VEj/PTWAGGcMpoClxY3s0SJhRQFbiS+NqZhCbWUBc4taT+WDlEgICEkv2nGeGsEUlXj7+xwpR
  Hy/Rvv8tO0RcR+Ls9SeMELaSxLIbs1ghbFmJS/O7oeK+Eh9n9zKCvCIhcItRoqPvFhPIDRICW
  hLvJuVD1AC9+7ULaqaaxPnG62wQtozE1cl7WSF6l7BJfFz5iRHil2SJD3PPQjXISazqfcgCUX
  SBWaKt+xgjyAJmoCfX79KfwKg1C8lvsxAyEGFFiSndD9lngUNLUOLkzCcsCxhZVjFaJBVlpme
  U5CZm5ugaGhjoGhoa6RoZGOkampnpJVbpJuulluqWpxaX6BrqJZYX6xVX5ibnpOjlpZZsYgSm
  sJSCU8t2MD478lrvEKMkB5OSKO8Bfe5YIb6k/JTKjMTijPii0pzU4kOMMhwcShK8N+uAcoJFq
  empFWmZOcB0CpOW4OBREuH1BknzFhck5hZnpkOkTjFackx4OXcRM8fN90uA5JG5SxcxC7Hk5e
  elSonzXq4FahAAacgozYMbB0v5lxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ8x4GmcKTmVc
  Ct/UV0EFMQActmM0FclBJIkJKqoFJYu3cB7/CM1aIpL7rmy9yJKrHPn6bSfRqZsePa5w2iD8/
  FehcH77RMuOF8JFDhy5sqVhVd1zin3DN2fmK7Dw3GlalBPHGTNkrw3U8l1tD591uhS17XM7Er
  v27VoHH+/IVy4d9s2YENzzodxI7Lhdv9zbO9sLOQ2Jfmxxu325/mduufmytil7ghPLO8wWRN9
  cnh994qf1tddm3FeLJs5xC9t3ao3zw7Kf5UYET/2QfDJOzn9Yl9FSyPf3Ry9rYuZFXA5iM/fT
  XttqGzGlYzPl7z4tj8x4bZ8+7tVd9lXzdfE9PF3fTRQ0bNFyqxYue6PZbxRu7nnYr+coVW21s
  ve7itj9n3/X87giqL3r8g6NeiaU4I9FQi7moOBEAbMLaP3QEAAA=
X-Env-Sender: stwiss.opensource@diasemi.com
X-Msg-Ref: server-16.tower-308.messagelabs.com!1561034692!10953607!1
X-Originating-IP: [104.47.12.57]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13967 invoked from network); 20 Jun 2019 12:44:52 -0000
Received: from mail-db3eur04lp2057.outbound.protection.outlook.com (HELO EUR04-DB3-obe.outbound.protection.outlook.com) (104.47.12.57)
  by server-16.tower-308.messagelabs.com with AES256-GCM-SHA384 encrypted SMTP; 20 Jun 2019 12:44:52 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector2-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I39A39H4OJIctuM7Erp9RN0D2ye45w30lyIqVG+wUI0=;
 b=D++Q8bNI8k3QLk3+VCiUMC36ZVq5KbN6XXZzuQPlhwVNFQsid8VzCT9W2gCjs3cADkHftZk8g2bN+o3K4DHHM29Fy5fU7KXoQpVwB6QBAujiqa+38TYpo9X2shLXiMbo99pC/oM2i7dSyV7Rd1xxr6LHH3n8egJOArKuPT256pc=
Received: from AM6PR10MB2181.EURPRD10.PROD.OUTLOOK.COM (20.177.113.222) by
 AM6PR10MB2918.EURPRD10.PROD.OUTLOOK.COM (10.255.121.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.13; Thu, 20 Jun 2019 12:44:50 +0000
Received: from AM6PR10MB2181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4561:9d63:48fa:a882]) by AM6PR10MB2181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4561:9d63:48fa:a882%7]) with mapi id 15.20.1987.014; Thu, 20 Jun 2019
 12:44:50 +0000
From:   Steve Twiss <stwiss.opensource@diasemi.com>
To:     Lee Jones <lee.jones@linaro.org>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>
CC:     "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "kieran.bingham+renesas@ideasonboard.com" 
        <kieran.bingham+renesas@ideasonboard.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "peda@axentia.se" <peda@axentia.se>,
        Support Opensource <Support.Opensource@diasemi.com>
Subject: RE: [PATCH] mfd: da9063: occupy second I2C address, too
Thread-Topic: [PATCH] mfd: da9063: occupy second I2C address, too
Thread-Index: AQHVJ2O+9kLXmLUZBE2ZJJdgV3Mbg6akeZzA
Date:   Thu, 20 Jun 2019 12:44:50 +0000
Message-ID: <AM6PR10MB2181D2A08D98FB9F8092EC8DFEE40@AM6PR10MB2181.EURPRD10.PROD.OUTLOOK.COM>
References: <AM6PR10MB218184C8F2206024C6CB77EAFEE40@AM6PR10MB2181.EURPRD10.PROD.OUTLOOK.COM>
 <20190620122853.GD4699@dell>
In-Reply-To: <20190620122853.GD4699@dell>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [193.240.73.196]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 232576c4-89bd-465e-fc73-08d6f57d15bf
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:AM6PR10MB2918;
x-ms-traffictypediagnostic: AM6PR10MB2918:
x-microsoft-antispam-prvs: <AM6PR10MB2918A42ECA20857F9EA33DA7F5E40@AM6PR10MB2918.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0074BBE012
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(346002)(366004)(136003)(376002)(39860400002)(199004)(189003)(66946007)(25786009)(81166006)(81156014)(107886003)(14444005)(6246003)(4326008)(5024004)(3846002)(14454004)(45080400002)(256004)(11346002)(229853002)(476003)(33656002)(74316002)(446003)(7736002)(6116002)(478600001)(305945005)(8676002)(55016002)(2906002)(6436002)(486006)(53936002)(9686003)(5660300002)(76116006)(86362001)(68736007)(66446008)(6506007)(66556008)(8936002)(66476007)(64756008)(54906003)(102836004)(76176011)(7696005)(66066001)(53546011)(99286004)(52536014)(4744005)(316002)(110136005)(186003)(71190400001)(71200400001)(73956011)(26005);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR10MB2918;H:AM6PR10MB2181.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SCgiyz4MAOtYZeHk2BKn4gdUMi78tEfjgo11fsTQRit1rxzyh83ExxFXz+R7/xyZgaS16ep8KVq3wNK/yOoZ0IzfxIu4uKvqLuogeWGnG0ElXT2uzIy1uT4mW+O8V+lTNhPB6qiIACQJ7vrdqTP6ukf77gVEdBzNAPgf8xPHR0GHlQmH010R7tx4zRPz6X4Du24cnO0ByXX2stTdMZzrJCbhQUE6j+6pcGU3Ma+ZHRXfuHpU4aX2P8rMDqDr+H2ERAJpmfJhplQlX5VsqaFZZC3yev+gC2/UTu3D+OgLS+XO/FwDzuapkFZwRQF9cO6fNTgJUo0PFAx8CpC2rzql0I0lxCF7Pof9laTt2boGfJI1r5B834OUvIWnf0KPIdN3du6TGEBKu5v8FuFlJCqv/YAQFEoEIlb9lbsL8w0T+UQ=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 232576c4-89bd-465e-fc73-08d6f57d15bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2019 12:44:50.3075
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: stephen.twiss@diasemi.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2918
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

T24gMjAgSnVuZSAyMDE5IDEzOjI5LCBMZWUgSm9uZXMgd3JvdGU6DQoNCj4gU3ViamVjdDogUmU6
IFtQQVRDSF0gbWZkOiBkYTkwNjM6IG9jY3VweSBzZWNvbmQgSTJDIGFkZHJlc3MsIHRvbw0KPiAN
Cj4gV2h5IGlzbid0IHRoaXMgcmVwbHkgYXR0YWNoZWQgKHRocmVhZGVkKSB0byB0aGUgcGF0Y2gu
DQoNCk15IGFwb2xvZ2llcy4gSXQgd2Fzbid0IG15IGludGVudGlvbiB0byBzcGxpdCBXb2xmcmFt
J3Mgb3JpZ2luYWwgZS1tYWlsIHRocmVhZC4NCg0KSSBkb24ndCB1c3VhbGx5IHJlcGx5IHVzaW5n
IHRoZSBtYWlsdG86IGxpbmsgZnJvbSBsb3JlIHdoZW4gY3JlYXRpbmcgZS1tYWlscy4NCk91dGxv
b2sgbXVzdG4ndCBzdXBwb3J0IHRoZSBJbi1SZXBseS1UbyBoZWFkZXIuDQoNCkknbGwgZmlndXJl
IG91dCBhIGRpZmZlcmVudCB3YXkgdG8gcmVwbHkgaW4gZnV0dXJlLg0KDQo+IElzIHlvdXIgbWFp
bGVyIGJyb2tlbj8NCg0KSXQncyBXaW5kb3dzDQoNCg==
