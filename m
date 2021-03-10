Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FD2B333CD7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Mar 2021 13:46:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231438AbhCJMqO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Mar 2021 07:46:14 -0500
Received: from mail-eopbgr1410122.outbound.protection.outlook.com ([40.107.141.122]:23451
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231880AbhCJMpm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Mar 2021 07:45:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JyswzTebY5T/j7p4dBLvnPNL8H+fgbR/zGcDNg0YvkRN0DsuyK6/W62BzWOgdoKHnjBnVslOEUsGKcpaI73Dpoo/5/OuVjR3qf08y/gh6rf/y/3t//otu4ofomuNutcqS08Eg7rw89ui85uB7qSy3VNCuDvVQLPVViH7ZZ/KYEoUgPjNqwdLhoRwFJsBXc4kXEz34wo87soxYWcNQqJYRSQ40PavgQSvCcAKLEHUpvIvpWI+CA+jIjYnOYb1n1tFdxbi470+U6XEbJA+Mxg8d2F9Rij321vyfh7ats43JCoW0CkXKSOfKD2TOnSPmW3a/dXBMyVNPX6qgl5+VnFD/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XzNBmCeNyCdku0yLtjvKxLULvIDXEucC1Vnb538lwQk=;
 b=CZBTEMPfvKYNErhRrN7ZSzgo8Wd1ZJ1eoPHe7UFd+RmE7zZuQofH1LQE0vQEG7WCy4fz/V8ub8ep9k3tJbCnsvt2mBhNhfv1fFQmhvexYxId2Iug8qqhk6LierBaV50FY7Vac68+8ek01cQ15v2kNxTOmOs36kSX/TvP/ALCBx+YZH94gtTRRcKzwN0GMOxmPmJE/btEfRa2Ot754YSS6T9a3+kiJLAaZ2aB2GdRk/3R2EqsZfyuXh/Z9EzkBT81iO/AkQc6ADyI+C++Ah56qznJOZZYhQX15pm7nV3zUZh9sVqrW8WUutyAtezHb+WNQYi6dcOsFv3OG9yMWm20FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XzNBmCeNyCdku0yLtjvKxLULvIDXEucC1Vnb538lwQk=;
 b=XHIpE05jZFpkeEnIneALRJW0LwJwHXTtq9C2eoERTx0tiBBlN5JdAeiJb/Q8BKxEQi2vwiwG4xxiXubrhNjpbt5h625XscLIbrnfJX6LicOEk1/eu1jycLE8U+RWPmsRWoJ3vApYrGtQ3AE8DI9k9zNfcEdphfAV453coGDAnN8=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYCPR01MB6431.jpnprd01.prod.outlook.com (2603:1096:400:9a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.2; Wed, 10 Mar
 2021 12:45:41 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::cb4:9680:bb26:8f3f]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::cb4:9680:bb26:8f3f%4]) with mapi id 15.20.3912.027; Wed, 10 Mar 2021
 12:45:40 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
Subject: RE: [PATCH 2/2] mmc: renesas_sdhi: do hard reset if possible
Thread-Topic: [PATCH 2/2] mmc: renesas_sdhi: do hard reset if possible
Thread-Index: AQHXFMXo4wNgQS9GTkW0a+Aab4SqFqp9FyLQ
Date:   Wed, 10 Mar 2021 12:45:40 +0000
Message-ID: <TY2PR01MB3692A6D95BD60A17AE698DF3D8919@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210309092332.30705-1-wsa+renesas@sang-engineering.com>
 <20210309092332.30705-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210309092332.30705-3-wsa+renesas@sang-engineering.com>
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
x-ms-office365-filtering-correlation-id: b3b049f8-7b54-421b-fb55-08d8e3c269a4
x-ms-traffictypediagnostic: TYCPR01MB6431:
x-microsoft-antispam-prvs: <TYCPR01MB643190D743315A91EACE34BAD8919@TYCPR01MB6431.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GVpgoGNvsuu6IjXKJLlzedk4vYl85uQsplKwEiDKm5jdBa03XdFbn1oC9vIUO6u/FTpJUoJChh5b6XIhX27/r71kSO9Tm1jm2QsCFeH6WNrKsbgad+limthqEghza+Fk77HXyadBALtOpCJXS+jvd6qikRMiFlS9/39/0DQzY33R2KV8z/Q2xzQ7xjTzgyhODktjbOiIB6e3J9nbUedgEJoeYoEyakBvvQVxcKQqfhQXBBOB6lOf4s/fzl8vmrZrnp5+itTmrEjmur13Jpz0Ok8zTgCdFK5yV7LAp1qXZWvTcgSnYib2W0N1OFvX63RSQOGBEiXFsTbYAmKD9eU2k6sstFvq/bwUl8LBoJZ5h3fPahuoN407VDb/NqpXWMoL7S7ZolHM+z1KzbcbHfhhjkWxEggWXRK6XdnPUAX2SM6kOznSVDPTHt0Uqjm11xKCsrJhCZyM8FHfeaqo7hYq/Ja1u6QjVEQFZMOwqZE8Dr91q818F9OZQdsrIMQ2j2WW/6WXSU5qN8JEFJSIza2J6g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(76116006)(5660300002)(478600001)(8936002)(4326008)(66946007)(66446008)(66476007)(66556008)(86362001)(64756008)(54906003)(316002)(26005)(55016002)(7696005)(52536014)(83380400001)(9686003)(6506007)(33656002)(8676002)(55236004)(186003)(2906002)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?HHTJALKi1pdLpyQsVLdxQf/jUn8/VXQmSMFmBRIu7Saq2zx5+AJpie1EsGx5?=
 =?us-ascii?Q?t/oF/YyfeiBdUDbsFgJNPRuQvcNXQLyAcv3/vEXQIYhRDdaTaKJJWFzM7YhV?=
 =?us-ascii?Q?178nd8XzJNh5ZVNfhR7Hd7jpXjU1AI2goulVGN1dRW1Sb9npQsVdLtB1A0tx?=
 =?us-ascii?Q?/2XN3tHTQVuaLXk3pfypUbvetHhAR4cXTF/ox8kW+42IbQCKVWABMcaxhQ8w?=
 =?us-ascii?Q?Ed+pKDA3Zpy8QE5G5ac4ESjPQvlFds20/LKak86Yb8aY/RoS3vUPp4bJsLyF?=
 =?us-ascii?Q?rcjnYJ92aNZtsMn2VMA1T4+fMzgTk5SGyZna+KXC3ULxDTMh5JZPmGzO9QYu?=
 =?us-ascii?Q?azNYHUY4W5t2XuLGIfni+304kgTyuIBRQHCES2OSouHV7DAbRE/iKw3kLfwq?=
 =?us-ascii?Q?CXZqNcJDqKmzY848jZ9+YpKsuoSdcsTiZQkfnxbdP5gY/mLKiu161AOjgb5K?=
 =?us-ascii?Q?JNV4DDDJpH+9POWSch2tOBlZgG0cEaOIieQZuZXs8Ivofld7liEPfpCn4QUd?=
 =?us-ascii?Q?LLDT0zfqnSJ3Hg+l1rDGp7yuEJsCgXTUmowPE90udt3WYmH0ngHFPf4FiXCM?=
 =?us-ascii?Q?Pb4efub0Yf4UBOIpilg2R1xb5cW9xIsw13r9uXGgUT32N3aNPK/2/At8vgOh?=
 =?us-ascii?Q?BlcibjUvXefvWghrGbmw7U+AJUwgTu0gjf9npj2yqWfWycvH6ioZD9jgHnyw?=
 =?us-ascii?Q?01CMz9P4kd1Nh+9LKg+PzLU1tu8nS2gVY/2RZXvpt5pJUHXn9eHY0KCBQVsS?=
 =?us-ascii?Q?DfuPVSVBsmGkHzDBAOTUIuICIzlVcYNSrUpMJXRRDfbFaCtyHNzpsdZPtwRV?=
 =?us-ascii?Q?7rYzNT5jIZK6apfAD3VFpSk3T24NnF7IlluR7lqWNkdIva/oIOj+Dnbf4io7?=
 =?us-ascii?Q?+2EQBWhVUiv0NAMrL1UnJR1/9iztbXMR65s3fFtG6OCevjgak2zW1lompZzP?=
 =?us-ascii?Q?ksP8RdLN+7Wz9oUbDuXcAhuzXWW84FCVUpXyjVEp5IJn9/7EX4xBSKjMrydw?=
 =?us-ascii?Q?xBNwIp+xdyfLTEMd0SKLYDCnhPunwYjeOcl3Icf9u0LVS2t8T8X5/zxXf6Bv?=
 =?us-ascii?Q?qqeV5ai85cShXcvUB120PAMbGb5NTdSyTa77+lbGAgde3E8cuaUbYVTdiG3m?=
 =?us-ascii?Q?tHWIaS1uQa8fCj0I8W4i+PebAc337sOenK+TX4iUqBfr6hFVSlA2VbcLMhjm?=
 =?us-ascii?Q?TjL25fj6nbCJqU8LulOZwzm6gyhPzHXMjehPyhoS7K7QpdxIuoEbQJmkXn6b?=
 =?us-ascii?Q?VQxY/uPeYgcwRjGDyVzMedVwJrxYFgXmRLEPkgMsko2LSC9huEpyLDLiU2sv?=
 =?us-ascii?Q?NgV5vcBeFTgIGYSf7lHcInXp?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3b049f8-7b54-421b-fb55-08d8e3c269a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2021 12:45:40.7216
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +keVWDWg9Bky1eHncuE2MaFrxOOW29RNSUq/vx8TOlNubhsd/Fd1F08QPyXn4zYaYk94Dxn18aGm7zNp4W7cXgmTis3gWL8iFer31GDJ0yhZ/DLaMNGR2bnXUYHiXz+L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6431
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

Thank you for the patch!

> From: Wolfram Sang, Sent: Tuesday, March 9, 2021 6:24 PM
>=20
> All recent SDHI instances can be reset via the reset controller. If one
> is found, use it instead of the open coded reset. This is to get a
> future-proof sane reset state.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
<snip>
> @@ -561,9 +563,16 @@ static int renesas_sdhi_prepare_hs400_tuning(struct =
mmc_host *mmc, struct mmc_io
>  static void renesas_sdhi_reset(struct tmio_mmc_host *host)
>  {
>  	struct renesas_sdhi *priv =3D host_to_priv(host);
> +	int ret;
>  	u16 val;
>=20
> -	if (priv->scc_ctl) {
> +	if (priv->rstc) {
> +		reset_control_reset(priv->rstc);
> +		/* Unknown why but without polling reset status, it will hang */
> +		read_poll_timeout(reset_control_status, ret, ret =3D=3D 0, 1, 100,
> +				  false, priv->rstc);
> +		priv->needs_adjust_hs400 =3D false;

After we did hard reset here, sometimes tmio_mmc_reset_work() cannot recove=
r
again with "mmcblk0: recovery failed!" message... So, I investigated this
issue and I found a reason.

> +	} else if (priv->scc_ctl) {
>  		renesas_sdhi_disable_scc(host->mmc);

I realized this renesas_sdhi_disable_scc() will set CLK_CTL_SCLKEN.
So, the previous code can issue CMD13 after tmio_mmc_reset_work() was calle=
d.
But, after we applied this patch, the CMD13 failed because the clock was di=
sabled.
# In other words, if a controller doesn't have scc, the previous code canno=
t issue
# CMD13 in such a case, I guess.

So, before we apply this patch, we have to add ->set_clock() calling in
tmio_mmc_reset_work() like below:
---
diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_c=
ore.c
index eca767dcabba..a05ccfc7aa0d 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -222,6 +222,7 @@ static void tmio_mmc_reset_work(struct work_struct *wor=
k)
 	spin_unlock_irqrestore(&host->lock, flags);
=20
 	tmio_mmc_reset(host);
+	host->set_clock(host, host->clk_cache);
=20
 	/* Ready for new calls */
 	host->mrq =3D NULL;
---

Best regards,
Yoshihiro Shimoda
