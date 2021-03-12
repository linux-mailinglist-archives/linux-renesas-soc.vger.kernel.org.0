Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E636338C5C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Mar 2021 13:06:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230064AbhCLMFf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Mar 2021 07:05:35 -0500
Received: from mail-eopbgr1320098.outbound.protection.outlook.com ([40.107.132.98]:8760
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229728AbhCLMFJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Mar 2021 07:05:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JgTcpfuFXqIkw17IlGUEYrq1qIxvMmg7t5LT4Ulpw/TFGTCcwOMSEvccTFMTDNj7lN+uzc0mPORm9Ut2puF/x7oTTpgYwmZXdgM3cKqzrEOQxQqN9ZxktJWA3/Zg6xJ3wWiuBuWAlN1BSn5QTxZDvd9mqqcOV2yGEK8QUHrkCK5pnvML/uWJWuq1ht5hzYhHMQ/1xAsfHavNp3fWmdQKKMaLuUf5SioVZTUZPTXYlVEtHAymyH2TlhpWO/oWDKxGGJoFxHrKQ3iduxSxVx8rFnbd6e+pL84Dp4PhCfyou37562VUKCp8+VA1BHgtva6u18eJ/pMl2CBqSuQl3r9mDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NYl7n/BeqtJIwBuZLI7t7HPW88fRLf0GpxXz9aXLKNs=;
 b=bSscStX47p8hwMYgHY/WlTQBjDV+bXpLULBAQN1qu6Xs2jjgBiAo88hfiprkmhadVwrl8kJc9atqhPsR21SiXZQ2hH52+tBLe0K93fXCSmQXeE/EF5ixWt3cd1KCnj97iL7/+DQSfrShdPNf0KTfW+viKhMZPSMHsmK5Lq1zOArqgS+Jjqx6sAWrVV/0BzBBJoMeYz7ex5WbOKmau2LWOp686Qsv81TBpKdtcufmq6mnG92fZuqhgStSDKHz1C+V8eB9WR9+6QpS1I8hDEtPeHbfDW7DZZ1iC7cvHsKYeYKSch1VwsCyHRFbxike7VTMa3lytblnoxxzsFCv5bElRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NYl7n/BeqtJIwBuZLI7t7HPW88fRLf0GpxXz9aXLKNs=;
 b=EY26jtkk1kBv2fNgCRSjkg7t9rMgMn3KkRwWpaNhY23BPa/UDXf7sWppg8+CN8bxY1MopoS8MrQY2K6h7xPcKi9T2WK+edb+lHSZeANd7SAORnHYGXRbV0AllaLgEcRPkkyywGcdCchqwZFA8Kfq/XzhtL9DdQywEgqby8jX0rc=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB4297.jpnprd01.prod.outlook.com (2603:1096:404:111::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.30; Fri, 12 Mar
 2021 12:05:01 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::cb4:9680:bb26:8f3f]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::cb4:9680:bb26:8f3f%4]) with mapi id 15.20.3933.031; Fri, 12 Mar 2021
 12:05:01 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
Subject: RE: [PATCH 2/2] mmc: renesas_sdhi: do hard reset if possible
Thread-Topic: [PATCH 2/2] mmc: renesas_sdhi: do hard reset if possible
Thread-Index: AQHXFMXo4wNgQS9GTkW0a+Aab4SqFqp9FyLQgAGxLgCAAXt5wA==
Date:   Fri, 12 Mar 2021 12:05:01 +0000
Message-ID: <TY2PR01MB3692BAF4BB03CDFE3D904B98D86F9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210309092332.30705-1-wsa+renesas@sang-engineering.com>
 <20210309092332.30705-3-wsa+renesas@sang-engineering.com>
 <TY2PR01MB3692A6D95BD60A17AE698DF3D8919@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <20210311131748.GG3566@ninjato>
In-Reply-To: <20210311131748.GG3566@ninjato>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c6d936cb-c36b-4765-8849-08d8e54f10a8
x-ms-traffictypediagnostic: TY2PR01MB4297:
x-microsoft-antispam-prvs: <TY2PR01MB429709413FFC956ED83999FDD86F9@TY2PR01MB4297.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d56IT8WVEYhhzQxse/zCgkGH0VUQog5ggcNKaGyClSeJTHGo8cM7Qq0er/TOAYR6VE8ZO8qfmKz5GLqn97KUGppmi34sQNY+uEtHUv/dkg8W3NXmBB1GZmLVavKHNLSsdGpAZr4rYJLiBnoQO3MqSq9xOepY2+/v8WZr8h7cQtpNgRLe5L7WhzCrB3neNKwFqMhcgFwIzk8o7RUeV5m6fij0MO8/COtp3f/CK0KFovou0NuXHZX8J/rSrsKWLZ351bFJO1RVXEfEfEZqUI5kAA3OZTlrIYkX8WRrJXwFeRPM5iYNh9fNkMJCw8yD8g0wd6qX2BsWaz6YItDy4G2WCpsCSIlsZtufQHU2BlMMwFWLisrqzRzifF1gl519WMb/zxWK5Imd+06QU8RPlRJ7il9N4e75U+VgE52+ihJSKMv5sZuiMfk0rPh4NPuAj6MOyPKPbUVmEKJ/pk7/eGoLEv6nmjqdMEUa5whq85SjoWqwwRgmuL/QAVAzOp6o6NyBE4yszsWezNhJQuHKCyS+kQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(39860400002)(396003)(136003)(346002)(2906002)(71200400001)(86362001)(5660300002)(4326008)(54906003)(6506007)(66476007)(55236004)(66446008)(66556008)(76116006)(8936002)(478600001)(64756008)(66946007)(316002)(8676002)(7696005)(83380400001)(186003)(55016002)(9686003)(52536014)(33656002)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?wCgPvLVv3J4XK6ceOhFRDKRE8cDutRLR81iMAUaj9Q3vw6ja/smdxiP8bZwN?=
 =?us-ascii?Q?933J/XUt7WU4NMpF6fceDBdvdndAGcyH9uB19ii4ajDO5O8yxxqonRrTfnme?=
 =?us-ascii?Q?OXnG4kXGEMjUqQn2hIi2/+NaJ/BmdNRvjrA5idwuyPK9U5bHVtJOmCp8AiBD?=
 =?us-ascii?Q?OUF9YeXPr5C9O7bGNGx+uKD6OcXtemNxoFMKT/JLgN4jREZ0AC1v/xsnUo2F?=
 =?us-ascii?Q?Di1ZptebW3gfSRMmq475imUJA6+IaL47zSsqSR/J1QngZOhc3BmMpoYg/FSQ?=
 =?us-ascii?Q?XCNsCjxKslqNOVpMOO9cUMfrR5vDUgtjCeHizDHCEIk0lEfliZz8U05hZMD3?=
 =?us-ascii?Q?AeGa6LeVDFtnOQj+R9R6CVE5Qp0DXk0QfA3WIguc1IaHwrvvWPqWqWxP8dvr?=
 =?us-ascii?Q?q0nToH+CZbIv5mb1a5ssk+ZbdL4Ez0O8hYOLhPds3cetbWkBQgTLIYYVDMRj?=
 =?us-ascii?Q?1U8VdaL3MooH+D5ReC8ox82/p7mscI9fglPoQ51pbwqOzLa66ElDWWTM4XGo?=
 =?us-ascii?Q?58o3U5AoyAHm0IzA+UTblBjYP0DcQ7JT34FDF7BKMmFAxgwT3PQcq4Wg2ctf?=
 =?us-ascii?Q?IQRvbOY1HYPqpex8T6YI5Fb6t87PXB/jTRd315SmxvV/hpZHkhiucz3IbMsw?=
 =?us-ascii?Q?cneDvVpihP2Mvk4e7rZ3QNae0xf+zCr0bIJD4rbESHc8ABfHoNMRsaTGwHHf?=
 =?us-ascii?Q?MEour7TFhFLn6jkx7bGFjPEh6SWTMm5UOBbtIwnO8zwOJgTSpdjAYMwBYLGL?=
 =?us-ascii?Q?4KKt3u1lgA5XBukrGRAzTj5zknyWNVQUFCxDC+CxpevFCh45K90BcWs5p70t?=
 =?us-ascii?Q?E0lHh4t4O9BQSjrc4o9yk+ofZdTPcydhP2xm+baLjX2SYyjfG5EAVWax9ISg?=
 =?us-ascii?Q?I4VxRuago+k1pkLWuuQOsNC4p/Pad1peCQ/IU+1ZWrN2O0RL572yvIku6eNH?=
 =?us-ascii?Q?jwY08Mwp/vy+mskdMNdwdG0UdoUVqQf1z4BaEZF0h6QJ5O3ICqrzkBd3XT4y?=
 =?us-ascii?Q?BmHv6QYMz87IPZrYHiAdhAqxSiCZYp8YtC4ggW2fTs2BOZ8QhF0HX3URonHi?=
 =?us-ascii?Q?9qnVtFoiEW0r36HFWvs0tItW7lnIEQ0msG69ARWLrxsgmQhqxs60HChbUTVZ?=
 =?us-ascii?Q?UfjW0r6udlM3TcHvmKWkHoZY69B4ciB6B0bWlVuHDlJJg6Vrw2VQuIXIpL+E?=
 =?us-ascii?Q?65ATnjyCc1clIQvC/QGOMYJqYxCXpNyNBp6E3d2krhgesVZEcjR+Pcn2fNws?=
 =?us-ascii?Q?tjI/J2YvYVQUHRw2Sgx93OOY6GctJJYIrEgP7f0D3Pihfs0QCk1FARnziMMQ?=
 =?us-ascii?Q?kYrE815ndqFoAoJ4HIGO6ccK?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6d936cb-c36b-4765-8849-08d8e54f10a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2021 12:05:01.6503
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Si79H2hzhnxL/7ZGsdB/QeI/xG9NRZxDeaFUQoDX1VNWPbLCsRLeKgtElLJovJmUKsLBK1zh7+10SvwIxM/nlvcZ8t3hQj3hpUZT6e6rMEtMmtC5OJLln4V1DtHWqurF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4297
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Thursday, March 11, 2021 10:18 PM
> >  	tmio_mmc_reset(host);
> > +	host->set_clock(host, host->clk_cache);
>=20
> What about putting it into the reset function itself, so it will be
> always enabled (like for the scc_ctl case)?
>=20
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/rene=
sas_sdhi_core.c
> index 473f155f6d3d..672953e3362d 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -572,6 +572,7 @@ static void renesas_sdhi_reset(struct tmio_mmc_host *=
host)
>  		read_poll_timeout(reset_control_status, ret, ret =3D=3D 0, 1, 100,
>  				  false, priv->rstc);
>  		priv->needs_adjust_hs400 =3D false;
> +		renesas_sdhi_set_clock(host, host->clk_cache);
>  	} else if (priv->scc_ctl) {
>  		renesas_sdhi_disable_scc(host->mmc);
>  		renesas_sdhi_reset_hs400_mode(host, priv);
>=20
> If you agree, I will fold this into v2 of this series.

Adding the function itself seems OK. However, I checked the code, and then
adding hard reset into renesas_sdhi_reset() seems to break the following:
-----
commit 5b0739d76227fd5a3f02f014385bfa9c86e0404b
Author: Wolfram Sang <wsa+renesas@sang-engineering.com>
Date:   Thu Aug 20 15:25:37 2020 +0200

    mmc: tmio: don't reset whole IP core when tuning fails

    SDHI needs to reset the SCC only, not the whole IP core. So, if tuning
    fails, don't handle specifics in the generic TMIO core, but in the
    specific drivers. For SDHI, we need to move around the reset routine a
    bit. It is not modified.
------

So, perhaps, we have to fix renesas_sdhi_execute_tuning() somehow before
adding hard reset. But, what do you think?

Best regards,
Yoshihiro Shimoda

