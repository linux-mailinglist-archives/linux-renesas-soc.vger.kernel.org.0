Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 956CF3A40AE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Jun 2021 12:58:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230436AbhFKLAt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Jun 2021 07:00:49 -0400
Received: from mail-eopbgr1310131.outbound.protection.outlook.com ([40.107.131.131]:47008
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231388AbhFKK75 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jun 2021 06:59:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TqkEbJt06yG1yAhZ0aJ8QXVfkZQrEQApqiiaUQHf59i5MNVM+zWlfoLs6iXi8gVbZfQkA9sDnx/xwTVjMSl88KW/cjdvLzt2LpQ+ywfq6+8xZUfmjmXzN97zSAm1W9iD1Ml9ngxYi9GdEfHQiN9ue7iIlYb8piJHqjHXoztFhCRghHFjopEjIzUsyr6TtnxC+8fAzv1/Ow1LAY0RLC2e4SB//uVobwWQLI7h95YRnbdytZq789MtmPHzhkzCqAuXwidUz27LIRaW7IfmzFtJMBf3WW01ZJ+QMFST1cC19spnZ3I/EfDuvYmye+ozUclG0U8S4Mip28lsaMN0leJq+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wf/PmzQG4ytdKoN7YKnt7R0go62A2zlIrUZyC1/sX9Y=;
 b=Ax5JdjJZACbS60pv2dUg8wR9ZPL2WoSv/6OrXzK5SwmW0gGOCEeROtQ0lfCQQZBHJIT8qIZLr5aPw7jAtmI9eE7ImdzJPzlSn81Yv40xJgC3vpRLpuT+IBKB5oLJaRGvy2s3egBZfhv4ncIH0dK/vjhmXC2tCydzcL5JAgTcXlt8aIOaj1oiWShthgbOF1YSBln9DF1Uk/iUNJld59F2XVNjb6Q4YpD0+K/Cp50olqWikeB76K/mvlGn2ltYy1H5T2VRtiDzSa6P862SzttvXb8hbK4wf1uEG/KtyI2r8d4NlfPJXIOsqLz1iz4ewzXVYdVKsM/RH8+YGrAloIuVUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wf/PmzQG4ytdKoN7YKnt7R0go62A2zlIrUZyC1/sX9Y=;
 b=kpqi3aMXs1G0m/E63LcoixrBriko5SdlzEgx9tkeMB1/Ha+yO14TpLmx9YPm9xcNb+BXzxL7KqSWFa//ljkCqfkySdQ/vCG9+6B3qzgTV3oxCaEVbQaF2JIKww4+sSkln0hQFuLdyZ5TSQRP9j7y8FXA6G75QRBRMA4qU5ywbTU=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Fri, 11 Jun
 2021 10:57:56 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5%6]) with mapi id 15.20.4219.022; Fri, 11 Jun 2021
 10:57:56 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     "balbi@kernel.org" <balbi@kernel.org>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] usb: renesas_usbhs: Fix superfluous interrupt happens
 after usb_pkt_pop()
Thread-Topic: [PATCH] usb: renesas_usbhs: Fix superfluous interrupt happens
 after usb_pkt_pop()
Thread-Index: AQHXXrAl3oGBwSWR9UqYPWlt9Cdaa6sOo3uw
Date:   Fri, 11 Jun 2021 10:57:56 +0000
Message-ID: <TY2PR01MB36925F99E90B91E235CEE168D8349@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210611105411.543008-1-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20210611105411.543008-1-yoshihiro.shimoda.uh@renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:205c:8ef0:b7f0:4c01]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b13b810f-2790-48ea-43f5-08d92cc7c4de
x-ms-traffictypediagnostic: TY2PR01MB3692:
x-microsoft-antispam-prvs: <TY2PR01MB369254A5DC2F33CA4061169ED8349@TY2PR01MB3692.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YLX3h1CveeWQD9YuzKtDjJJJ6ToNa2V+omnqqw8YjiOQggyFVklyrw7pJcxK9KXQx0XLR5FPuLbpgoxo64ugZVVfj2YwCf1yh0ksM9gMtz87LMqVrY8/Vh7g+bt1T/QGHXe7owYZh9DjctujEqr9xqxj9zx1wBzK0LELmvL8fIHwSxHgXXHWFgIdwQ8768uAVuHTxe5WPcPKEIUIElrJfTucy2WdNe9COASb1CzbGgipcghCe3rCzULwmYxQLDAxvrMchAN2Qo6UmdrXYxFvolmi2WK01n+yPsgVKWW3YVEHjYwtr7T10O3N8atzCqzYjo1+4WKeqIDDMO3dTPgePboffK2TaiaSrYKkDYnerzy5NqGuGd7kxLRd1V36owPL9Uyy0I5sG9oYrZCZUq2bytAM27AbtF1x3XIN36jjBffRchF92Nwxjh8Om860r6YxsRaLk8AsqtupE+S2Wi9TdZqyz4AbH3qAh5ZxtJPh4WoZjG+NhWrL65m+KBRbGYB1hcH0YXxYfXIYj0tHix0oEH0qm8UyB6y8oYlL4Ct/DyfEXYZOXOVZkDKqYe2eFGl0VdQNCEK+bI/RoqiLeoT/X43Y3ZWcFXKvS+c48Xtqhrg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(376002)(396003)(346002)(366004)(38100700002)(55016002)(122000001)(33656002)(52536014)(71200400001)(558084003)(2906002)(8936002)(478600001)(8676002)(86362001)(4326008)(9686003)(53546011)(5660300002)(66476007)(64756008)(66556008)(66946007)(6916009)(186003)(54906003)(66446008)(6506007)(76116006)(316002)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?tg84yQbase4mTjjx/G/1SnvYFMGfUDnHlS98nEkdbSLk+dz+wH8nSVZQv9Dl?=
 =?us-ascii?Q?57BEiqbuu4rZZkxXWBrsH0UoXQRsQkyJS5kE4n8YW5N2oVAKmgw6sgV42G5A?=
 =?us-ascii?Q?P14o1uSbHq6l8Jj0pEqTQhRWvNx5E+ujeLuReT35SVZs+H22i+txPhHowKM3?=
 =?us-ascii?Q?lkgd6WQQvDGQuwWyDE7LRDGFsrZtUL4SNyC3fZMuV80W/tI+8SDusgglJ4I0?=
 =?us-ascii?Q?IJ8wdU1Zrza9oC27cOfm+YTo6aWD/5rO1bPEoTQ1D6VnReNHzXQpphxtLHer?=
 =?us-ascii?Q?57vNtkgLtWNrdmQ6eRRifknVO0WbYlodIX98DeAECdkAd0UcrwSXPKdxml1W?=
 =?us-ascii?Q?d0Hpt+sgWuOSw1SGum380c8kHvU7fDaTkiIcCv0ZTFeofeKyorEGMlmkAOf4?=
 =?us-ascii?Q?m7xHo22FSR1gGCA4mAm8ml6k6zeJD/lB6dN6axWbMjTbYbO5XnenzfKjmSAK?=
 =?us-ascii?Q?X35j56T7+8+cl5JKFFeFfnTgt/GXO4AelpH1pvVxmPaC5GrQ8gev+sQlDpw9?=
 =?us-ascii?Q?m3JBnjoitSGtu0QaRIHgG1vR86WfkkITkq/3D3vmxjhcC4kjlEuZMhb4NOFg?=
 =?us-ascii?Q?cor0rjGJ5yDqsJXSFvVZ34ZHjJFZZJElLyBz8tZrnoKpO2iSzNsoub4JehRM?=
 =?us-ascii?Q?olewKeGhgWFGp8J0iT4mo/VGlSfQQ2hEf7pcACHbyaf4rmOB2LkcgU/xr1mt?=
 =?us-ascii?Q?0/6WKd5zX/8wQIBdcxNtu/XPUcYX1a30kGvVaHNR7fhZX3iPgIWPdHBidmwa?=
 =?us-ascii?Q?f7+zvREPhDLQktYrPYt4UkDeDzvwZa7eoUAYVay9FDg0Tz/16RNg33UBvEmu?=
 =?us-ascii?Q?m+CRlNP7ydmnWLhBiipOttR3n7YtY9hGZt99OsrMg5Bh+QlArPMbmwGgSwhL?=
 =?us-ascii?Q?DFtFZ6UeWyXw1KOr5CN6f2GT+NUS3fooSBorS22gRCBZmN9TZ49nM1O0cpav?=
 =?us-ascii?Q?w8IZSuDVrQotqjcV6NxjsdK3DIj8SN13feCOdfRx7FcXNB+IEKUuwWWsq2eH?=
 =?us-ascii?Q?8qF+G9E4JW5pedctmpNsePj0aSrWnrpbS6jEBCJrIXKVkrxgQhlBeN1qrmWS?=
 =?us-ascii?Q?FzeadafHPKYfHHECYBlzv/O85p26CR9WFr/Xr8l4qziIbQ6Kb+JQ1fO4+QUA?=
 =?us-ascii?Q?0FA+XudVfebFyNu7aTom/0ZguFGictJWkaVmEC3CrivssIFBhCcmDVdjFvmx?=
 =?us-ascii?Q?Fj9IWNZB6hWEQoWH+V0AMkvoSAJMTPQ6kFnKPO1F5zrxaq53E6xciIHmM6/k?=
 =?us-ascii?Q?MocIzuVcYsqSAPml9TGLRFBO9Cmlu5P8lDjUcE2+d0tMPlO3cO0BFUOsulME?=
 =?us-ascii?Q?F8wAJstQeYmDmZfNiV84wwuFoOduo/kFw7/V+Rrmm9y39ABiP9tAIQP+0MQF?=
 =?us-ascii?Q?AcyCxwU=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b13b810f-2790-48ea-43f5-08d92cc7c4de
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2021 10:57:56.1411
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9SBFT5qAZbnz1mF7bnT3YvE8qhaG8Upc716V4w/vAM44SzN3z5V3DTWF4lZ0oi6Ih0m0nJx7E8CVtQWGdaUtUBFDdzL6W+0UaPU0uhGVRIz4DBXssRzcWza/0NmOMZdI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3692
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi again,

> From: Yoshihiro Shimoda, Sent: Friday, June 11, 2021 7:54 PM
> Subject: [PATCH] usb: renesas_usbhs: Fix superfluous interrupt happens af=
ter usb_pkt_pop()

I'm sorry. I mistook to send this patch.
So, I would like to recall this version.

Best regards,
Yoshihiro Shimoda

