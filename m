Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70E2A408521
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Sep 2021 09:12:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237560AbhIMHNk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Sep 2021 03:13:40 -0400
Received: from mail-eopbgr1410118.outbound.protection.outlook.com ([40.107.141.118]:20032
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237454AbhIMHNj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Sep 2021 03:13:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X0FA/NP2vmNOGOHH7JHF2Lan8f5VCKcWp8B0DFEP/gMHhIhZ5wtnx+nlLuK0LXa/OBc4zwbynklJ+jSp4cepq7FMuvwVbXN73bZ+fbygFl0SXjiKKk858yn35zdopOweTRaQRvbIPnDRz2Jr4vfjqiAXkB0BQZEzezh1OHjPwJfP8YYxU70ncmHueItGh1Z0W1fQf1kR2ggfVgC1UOwwGLo1iDoiAtYLIraR60EHOnd+AT3pYjh1LQU3L+7tz9zGjDTa84H9tn/siu+LakCLp3LIsJoFm3ofE9lt+JNO4uvspWis9oJSfJAwKCchbhygcQQBzNhg78I9figR34q+tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=n33ryBj2/a/Gr1g0H7WQcIQKfMgPR7825I00Ot6Dl54=;
 b=bdO2XwNOLthtqJNFleVhZPFN2v+xBSPAFVxNDXWww6ljXbXmJnQABWBEXNB7TsLubSbyh37LbMkQ+OGV/pvtPk88t1rKSmnFZp2GYRie0gqnkh3Uo7Hr5cxM8hJBN9QUR0Q6kbhhpgQlO1dUC/lfV/wjHOy9NRFI3JYS1ja2RUQj5kstNSaeDVf8UxQ8S3CA7EOQORHiVMEjOp8hD/gYgyLe3hzM9MOHrhLic5X6OUrEsZsXpr1qwUgW/e/xySpIXE5OEfCCeeee7kCsSNOt7nY4Gq8W4YYv79IrwzQl+6dflJaVVXPzpqsnUbU5JYDO5fjYYrg9SzREaUJD/qf4gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n33ryBj2/a/Gr1g0H7WQcIQKfMgPR7825I00Ot6Dl54=;
 b=qU1/BLsCuABWtwoIzZkmlDuRAxxuXlbIDZqtu89oxLdjRtqKCIhnionAk5fCuyRRZWVCY/VLO9s/xd0nKwt06rS6Uj4gWPSGvofBv0CpeOtH8pkPBH0M90dpimSKsjR6IcrPBQYnkWsBp4znD+B8YOPZhoaz2dMqOo0n5nvGjxY=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB1903.jpnprd01.prod.outlook.com (2603:1096:404:4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Mon, 13 Sep
 2021 07:12:22 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::5885:70e3:e339:dd7a]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::5885:70e3:e339:dd7a%5]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 07:12:21 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] usb: gadget: legacy: audio: add c_sync parameter
Thread-Topic: [PATCH] usb: gadget: legacy: audio: add c_sync parameter
Thread-Index: AQHXqEmzTYDFRth6L0CK90CjBiNQPKuhdm6AgAATFCA=
Date:   Mon, 13 Sep 2021 07:12:21 +0000
Message-ID: <TY2PR01MB3692FD9664AD13C9875B95DFD8D99@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210913024723.1334206-1-yoshihiro.shimoda.uh@renesas.com>
 <YT7nD+ToVpe135LU@kroah.com>
In-Reply-To: <YT7nD+ToVpe135LU@kroah.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8850710b-14c6-4b2e-19d7-08d97685d4a1
x-ms-traffictypediagnostic: TYAPR01MB1903:
x-microsoft-antispam-prvs: <TYAPR01MB1903543BB9113A5FE0E9BB67D8D99@TYAPR01MB1903.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZwH9Mb2QlQ8gAlJaTIC1LoHBYAA4kO11x9MSWll2HdKLs+OiZ5qky+WG/rUB2MWy+R/GFsuGfaEokeOZMIIGVs94xtOmerX8QNtWGe9PkMDaN5+u0kPvuDwRcQFkAjATmTgjd62jMsvNet5kT3/1ZzZE1OgBqoTXUDjmrhNQK+WyMRO0D4s9CY4hoQRI3LpECsstDTf7eCH7vOT8S+81oV+5lBNmsPf08YthzGX7nd8whdUceO4i8npBfdfWKBMgNti3VKTzkGnAR0apGV38mcGawrasDkPnsxnZZt4blmHBlV83+4zY5anKalNEg+VSLYZq1KKGO0IEuK2VDKhAar9YvpqWukoYQE/PUaWGDJtn2F7WGMg61lmvF9B3Deakc+vK6JV7f0HohBlCVICAJZQfyNFdfdg1lhH85FtTwYfIjSXI+v4cdLQhhYxqNzKze+zGUv0mz6Dpo5PBJw2iuUfHkH7/J6lHRQbY25VVXgay3mX/dL1FXZ9chl7wsufeNbGLjB4jrdXwC6R1Zdj8ErEtCXRg54PRGNTaXAIqb/RnVKVu4cVx/1ALQfm6wu3X8Z9ZngL16q+VeGeA47rpNJjxvFk4tbN+Q3Ok6/pxzgpU3tHg/7erhhssJpAYeoyiZ1gkfPa4dgqhdINwHYHAvI1N/oaiNOJAYz+mGaDaZX7gHwr09gPAgn+FFbMhChYSDDe5ZLLGcNGziYQgC2Kx+g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(122000001)(8936002)(6506007)(52536014)(71200400001)(86362001)(9686003)(55236004)(7696005)(8676002)(26005)(2906002)(66446008)(508600001)(186003)(55016002)(54906003)(316002)(64756008)(4326008)(66556008)(38070700005)(38100700002)(66476007)(33656002)(6916009)(5660300002)(66946007)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?005PwqwhMiIiZz3LWkk51Uz+JO02g7LULSlA/xs8TlRLCgKk15B4ooqVrTEB?=
 =?us-ascii?Q?oHHUZlQ/hSmlqFTNr17dmxEM1NuFZdd3rouI27nbqRZlDjUGxxYsRRaz3vde?=
 =?us-ascii?Q?XoJdVtgMGS0ebNiarOjKUOR7Vl7yT3OLaxwtmdgZ9tVKQYyewphT0gIkSLsv?=
 =?us-ascii?Q?MpL78tOpPzRiNyeipuY89c+y3bkjco9zC30SkBAqit7AgymvuWy3hqQ9eE5D?=
 =?us-ascii?Q?h8eRAW5AgceyX55LJ6SX3weL5u9HdouHuPHw+kvnPvyD+yqf6MF4TTKUGZCw?=
 =?us-ascii?Q?oipt8zkmjNYY8984ECi/W/3hBTYL1+MnBg1abp/QTQOkYbQmxYtCQov8xwNF?=
 =?us-ascii?Q?ihRMrqQ90gXtIH9CZZDWVNpUAKMWHcHjw9glAGWk5z+GrNMN+mr5G9z5Dkvi?=
 =?us-ascii?Q?XvGQmLGFWy411TMfgN9zEFQ1anX2gKe12xwWOdaprv/J5THzz9eMzOaT7oJA?=
 =?us-ascii?Q?gkkmAs+urLjSlakf/9YoEJ1glnn6YtXeYWEEkDcH9C1mgu71i/s6cV1+erg0?=
 =?us-ascii?Q?cz8LVPJgjcLQuYZxea7L3viiEX2XZyDORfqIq/cGL0lJUPfeWSRkogk2p3nH?=
 =?us-ascii?Q?Isre67FyBURLsMIstd3kMfQ0O2yb+KDvu+7WGx1KYCTtYHxO9UO52J0lTEZt?=
 =?us-ascii?Q?oD/QGuZh0ahA3gh79QGhHU3E0Jj4rqLkLbLDz62XRDOxVkZNr8/VOuhu88ou?=
 =?us-ascii?Q?hTbTjKLKkyp7BupL7+2O6yVtXv/NCa9rY26PQoo/+2wWFJMsG6RtQUK5BP6g?=
 =?us-ascii?Q?5BMuLWYPOvz2SNDglcfw8l21B6IvPLmt7OoMcwE9KB3tvTn7UA/lDS+CSvKX?=
 =?us-ascii?Q?BFlY+TRcLHfy7ZYE1Dp5SaF55jrTXQ41FOrGpRSviT0ORQLCqt2PMffs5UWl?=
 =?us-ascii?Q?pPL2daHsMBr/66e0tfOCbaJ9FJH4KYZfGThnNscVs4UafZZA7fuhEacf0LWL?=
 =?us-ascii?Q?qZg9CBlFcHGdTQOiJKmOTVumegsEUvhzvxtBaV7CUfGYjPWAPAx+ZfPpbR+P?=
 =?us-ascii?Q?Fe74hVgUIhUAIyNxv7wU4fO1gWa6RfJWZGeOfu7igwxQqlsb5YbTdQUxq0Dl?=
 =?us-ascii?Q?Y2bftXIDFgWeEjFeA4x4oxqSTZ4bfX80TTTakWPvI581HuwLJav5qC3+lBHG?=
 =?us-ascii?Q?tAxMu9P0nSJl9AXKOWVPiZrFPzTxHKVKFOFnxOYGpbro43mwPYuvK9KjBUXu?=
 =?us-ascii?Q?wph4dzmi7961BCZvC496fiLxcy+R0igMjL/bfuwv9x+I14LGitSmGxYLnViz?=
 =?us-ascii?Q?zN3cXgFRUuyRIk7bbXtuXe7eZaU/MMMKDmZlJ4iJ8bVXnMrc3i4W0HZLL3iT?=
 =?us-ascii?Q?SnGgIJTn1Fncr4ATSkwxY7MQ?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8850710b-14c6-4b2e-19d7-08d97685d4a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2021 07:12:21.8362
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UDyBY6mSOQrvLMK4NtG03QmxZe0KncGweYkTyCmcWopUvuC964fBAsWK1BBw3j47SrejLzo3BIaSThwhd0KbBKpJBm/hj/HpTkY3XIjuUgCzAroUM4AwTs+l4WaZK2A3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB1903
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Greg,

> From: Greg KH, Sent: Monday, September 13, 2021 2:52 PM
>=20
> On Mon, Sep 13, 2021 at 11:47:23AM +0900, Yoshihiro Shimoda wrote:
> > The commit 40c73b30546e ("usb: gadget: f_uac2: add adaptive sync
> > support for capture") supported 'c_sync' for configfs file.
> > To configure the 'c_sync' via legacy audio driver, add c_sync
> > parameter. And then, we can change the 'c_sync' to 'ADAPTIVE' like
> > below:
> >
> >     modprobe g_audio c_sync=3D8
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  drivers/usb/gadget/legacy/audio.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/usb/gadget/legacy/audio.c b/drivers/usb/gadget/leg=
acy/audio.c
> > index a748ed0842e8..f9765bf63006 100644
> > --- a/drivers/usb/gadget/legacy/audio.c
> > +++ b/drivers/usb/gadget/legacy/audio.c
> > @@ -49,6 +49,11 @@ MODULE_PARM_DESC(c_srate, "Capture Sampling Rate");
> >  static int c_ssize =3D UAC2_DEF_CSSIZE;
> >  module_param(c_ssize, uint, S_IRUGO);
> >  MODULE_PARM_DESC(c_ssize, "Capture Sample Size(bytes)");
> > +
> > +/* Capture Default ASYNC */
> > +static int c_sync =3D UAC2_DEF_CSYNC;
> > +module_param(c_sync, uint, S_IRUGO);
> > +MODULE_PARM_DESC(c_sync, "Capture Sync Type");
>=20
> Please do not add new module parameters when ever possible.

I got it.

> Why are you adding "new" features to the legacy driver?  Why can you not
> just use the newer driver instead if you want this feature?

I can use the newer driver (configfs-base), but using the legacy driver
was easy to me. However, I'll use the newer driver instead from now on.

Best regards,
Yoshihiro Shimoda

