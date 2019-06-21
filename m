Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91CC94E5D4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2019 12:23:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726498AbfFUKXf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jun 2019 06:23:35 -0400
Received: from mail1.bemta25.messagelabs.com ([195.245.230.3]:13567 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726558AbfFUKXf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 06:23:35 -0400
Received: from [46.226.52.98] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-3.bemta.az-a.eu-west-1.aws.symcld.net id 90/02-18998-320BC0D5; Fri, 21 Jun 2019 10:23:31 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJJsWRWlGSWpSXmKPExsWSoc9ooqu0gSf
  WYNc8A4svc0+xWHy61s1ocf/rUUaLy7vmsFlsffmOyWLvofmMFn3n3C1WnpjF7MDhMe3AbHaP
  9zda2T1md8xk9bhzbQ+bx7OF61k8Tp56wuLxeZNcAHsUa2ZeUn5FAmvGkc0TWAuuMVdcX7Kap
  YHxD1MXIxcHi8AJZomtV7exgDhCApOYJGa0PmCHcO4zSqzb/ZGxi5GTg03AUGLem/dgtoiAik
  Tn+v8sIDazwHtmiclHU7sYOTiEBRwkuieWQ5Q4SizoucEEYTtJnNkyG8xmEVCV2HP7DdgYXoF
  YiSMX5zFB7PrBKLH8wGSwIk4BLYll0/+BzWcUkJX40riaGWKXuMStJ/PBaiQEBCSW7DnPDGGL
  Srx8/I8Voj5eon3/W3aIuI7E2etPGCFsJYllN2axQtiyEpfmd0PFfSXmLF0N9r2EwC1GiTdzT
  0IltCQWTDwKtSBHonFyL9RiNYkp6z9BxWUk/u2aygzR3M0mcXbSTbANQgLJEh/mnoW6Qk5iVe
  9DqA0XmCWO9x9hg3hHR2LB7k9sExi1ZiH5bhaSFIStLbFs4WvmWeAgE5Q4OfMJywJGllWMFkl
  FmekZJbmJmTm6hgYGuoaGRrqGlia6hiaWeolVuol6qaW65anFJbqGeonlxXrFlbnJOSl6eakl
  mxiB6S2l4NDUHYwrj7zWO8QoycGkJMp7ioUnVogvKT+lMiOxOCO+qDQntfgQowwHh5IEr8U6o
  JxgUWp6akVaZg4w1cKkJTh4lER4F4KkeYsLEnOLM9MhUqcYjTkmvJy7iJnj5vsli5iFWPLy81
  KlxHmvrQUqFQApzSjNgxsEywGXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzrgGZwpOZVwK
  37xXQKUxApyyYzQVySkkiQkqqgSl8z7Q4Yffy2ak7zn5i+1vN/ZMt+TJr/TnRDecs5t2Y8eeU
  f+rGY3xaF5oTT2mnVdxQkM4pm+iYtiL5+JxdSowtHI1ajZo2k07Ez+R7xXNSNNzmseNU/6/rz
  KvyOJ79jIgqadY9mNe3fVuHu8DDLLUX3K9lps3RSzp1RLuEKWa/19z1CkIa7JKtvjMPLlcxbl
  ni2eXaknYs6t0MW93rrFmXlpWLh85hmOTJz95+cFmK7KEmOweHW5HvbLVstggWC10518o/u1Q
  xVmc/n/nGm+dF52vsXzV9w91VZ74Lr9H/pscWzjmVWVHG7Pmuk20G2z5JizMs3pu7afW6TxGh
  M4TDCtNlv+Z+4Yt5Xu2spMRSnJFoqMVcVJwIAD8Clrp8BAAA
X-Env-Sender: stwiss.opensource@diasemi.com
X-Msg-Ref: server-18.tower-262.messagelabs.com!1561112610!1492325!1
X-Originating-IP: [104.47.1.52]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29808 invoked from network); 21 Jun 2019 10:23:30 -0000
Received: from mail-ve1eur01lp2052.outbound.protection.outlook.com (HELO EUR01-VE1-obe.outbound.protection.outlook.com) (104.47.1.52)
  by server-18.tower-262.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 21 Jun 2019 10:23:30 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector2-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Io2ydawoi31VItfGDHbyLYfHdUGzkTnJA6UhG2bZIuM=;
 b=LYuajsqqBu2ewOwcBqJ4XSGZtMP4rlmK9kbNEX0xyfxK8JpCfty1mmztr4jq9WkPhnCdPOakqSW/ea9wnZ8e2kH7DQ8d6oWl4IeVayd5CMuYP5+RAQ+E43VNBrgJhNRtHDrTZxaPhYXqKPYodpXmWpS6Cg+aLJ/Id30DteEf/XE=
Received: from AM6PR10MB2181.EURPRD10.PROD.OUTLOOK.COM (20.177.113.222) by
 AM6PR10MB2536.EURPRD10.PROD.OUTLOOK.COM (20.177.116.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.13; Fri, 21 Jun 2019 10:23:27 +0000
Received: from AM6PR10MB2181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4561:9d63:48fa:a882]) by AM6PR10MB2181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4561:9d63:48fa:a882%7]) with mapi id 15.20.1987.014; Fri, 21 Jun 2019
 10:23:27 +0000
From:   Steve Twiss <stwiss.opensource@diasemi.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "kieran.bingham+renesas@ideasonboard.com" 
        <kieran.bingham+renesas@ideasonboard.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "peda@axentia.se" <peda@axentia.se>,
        Support Opensource <Support.Opensource@diasemi.com>
Subject: RE: [PATCH] mfd: da9063: occupy second I2C address, too
Thread-Topic: [PATCH] mfd: da9063: occupy second I2C address, too
Thread-Index: AQHVJ0mFTYYovliAiEq8ojZ9DyPua6aly35QgAAY5oCAAAJAYA==
Date:   Fri, 21 Jun 2019 10:23:26 +0000
Message-ID: <AM6PR10MB218113C2BA3940643CBFEAABFEE70@AM6PR10MB2181.EURPRD10.PROD.OUTLOOK.COM>
References: <AM6PR10MB218184C8F2206024C6CB77EAFEE40@AM6PR10MB2181.EURPRD10.PROD.OUTLOOK.COM>
 <20190620092116.y7aqun6jjjn4mgow@katana>
 <AM6PR10MB218134CDB4ECB0A9534B6B96FEE70@AM6PR10MB2181.EURPRD10.PROD.OUTLOOK.COM>
 <20190621100959.GA2568@kunai>
In-Reply-To: <20190621100959.GA2568@kunai>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [193.240.73.196]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9d600031-e3ef-48ee-21a3-08d6f6327fac
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:AM6PR10MB2536;
x-ms-traffictypediagnostic: AM6PR10MB2536:
x-microsoft-antispam-prvs: <AM6PR10MB25364655186D9692AD9F2620F5E70@AM6PR10MB2536.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0075CB064E
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(376002)(366004)(136003)(39850400004)(346002)(199004)(189003)(229853002)(107886003)(4326008)(6246003)(71200400001)(4744005)(5024004)(3846002)(76116006)(478600001)(8936002)(446003)(71190400001)(99286004)(11346002)(54906003)(186003)(5660300002)(26005)(52536014)(6116002)(68736007)(6436002)(2906002)(33656002)(256004)(55016002)(7736002)(53546011)(81166006)(66446008)(73956011)(316002)(66946007)(9686003)(66476007)(64756008)(66556008)(486006)(53936002)(6506007)(74316002)(476003)(8676002)(7696005)(86362001)(25786009)(14454004)(76176011)(66066001)(305945005)(6916009)(81156014)(102836004);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR10MB2536;H:AM6PR10MB2181.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Qrlcx0XzdV07FiQjB4HJ4FD3rSiWfKjRMVgLvSsM5T7ehuVBR46Xarn6WSLWjr7ZMDQv2Rz6zO/xZvSR16jo4sonjEEX7tKxYSxryCergIiR/zrOEf9m9aq6QHwtYxaWOm1FRoTjcddVNQYgVI7t8lnENxEM4SBv61vEb58VLv8me5zjptBHxfFZygBzPJxsFjZ4x+1ZzHli1/ysDSFUxIeP5vmz6A278LoZzEYScLYp24DjvSGK7TdehpiQJfIAGCTh0jt2HIuOLDPPlSRgxlX+KMlSYErI+LVxl9WtWyRBPTWckBXb0I0akxdlpf83yJuquNWX83ZaOOuhvk0K1WXKVL05Q8/wh7bj8GZdEO0qzaFL6np28XWc2cnj7kRJf3RdcXg7LAAdooZrgAknc9p6NHf5m8FB8+ijMvEDKHk=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d600031-e3ef-48ee-21a3-08d6f6327fac
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2019 10:23:26.8699
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: stephen.twiss@diasemi.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2536
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 21 June 2019 11:10 Wolfram Sang wrote:

> Subject: Re: [PATCH] mfd: da9063: occupy second I2C address, too
>=20
> > For what it's worth, maybe consider adding a dev_warn attached to the r=
eturn
> > of devm_i2c_new_dummy_device?
>=20
> I am in the middle of some API changes. Once those are over, I want to
> think about such warnings as a second step. I'd rather have them in the
> core than in each and every driver. But this needs more thinking...

No problem.=20
