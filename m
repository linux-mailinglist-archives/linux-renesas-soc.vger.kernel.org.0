Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63C562A7DF4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Nov 2020 13:05:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730650AbgKEMEz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Nov 2020 07:04:55 -0500
Received: from mail-eopbgr1410098.outbound.protection.outlook.com ([40.107.141.98]:13981
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730714AbgKEMEy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Nov 2020 07:04:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PjfZIYsFcKOH8mmMlvMnBv1vZo6MDZ2dtq0NLgqypkbN8XmZB/O0AmdOxpO6/JTMdpg9pTIefs8s32kdao/udjjr8tYLpCe9ChcKmfZOLDUCEgtUFgnU+8MK3jcuhIWQP+eOivTra25017Ppl1TRu+YqU0A3Mr0nP3Ytg7/shhANdQ4h8AZUdly/doXTybe3VNFUalnWtYZ2LNMXqrqqYZR9xxS/OZiVrF/jnaUg25Z7vvry93p0//T4PwIM4RjphwKyiombhZEgri85co98DSW3tSTQLTA5Mn1ZwkVQcn4MJ4gt/PPq0yXNZMttUA5KFBcSIpNxTOgwWwPM+ok1kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BUif+fmXOMW7N1t4gmiwaw02TwFltBsED8Z9TXuGAeI=;
 b=Inbu3JkmxEv6bOpivUOo9jX90WplY1zxRhyNzRUeChe69QnqJdh+JWqOlIvxkul2Kmhi8xEzO5J5Dgzz+e6st4QuwgAdlZlMaLpnw/NeY5rSo6BU5eqRYgB1MM9XH8N4es2ZQFtAQPOQkGqcjYSRK9kbJSAyacdMCQyg5xPDJWMgHl2n6G9FGMBWewwLdlctcawSRqy/B08zANXWCH4SUGD2YFfHfpfPwsfVjJBTEYKVmhZmYjnMRxZxxpuJoAerbdHU/4JZax/6L1TOJjlbEna5pe4ZAKSaQ2o0b3lIJql4gWEEKg+NzpXMVwvfa7N2uAw3rFC36ANyVubgA+raWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BUif+fmXOMW7N1t4gmiwaw02TwFltBsED8Z9TXuGAeI=;
 b=bX3PXF8w6hCd0GlHJcIwfmrMJ/nPMeJA9BI/iEjDRKemwA+sS0mlu+xFGE+Idxn/mSc5WRZnPyXUXflEtMB5xSffIOfKRTOFbQAVjEcfgAotcbhXgBwG88xvRF7ZNH9FMx+OgdlX0MKUvRCyNziz6KB7HHGvBzGZBOvM4bh0Mmw=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB3935.jpnprd01.prod.outlook.com (2603:1096:404:c2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.28; Thu, 5 Nov
 2020 12:04:50 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::bcba:dccf:7d4c:c883]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::bcba:dccf:7d4c:c883%4]) with mapi id 15.20.3499.032; Thu, 5 Nov 2020
 12:04:49 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>
CC:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2] mmc: core: issue power off notification when host is
 removed
Thread-Topic: [PATCH v2] mmc: core: issue power off notification when host is
 removed
Thread-Index: AQHWsP+VkFFkkB7XykutJW/IbySArKm5cS8g
Date:   Thu, 5 Nov 2020 12:04:49 +0000
Message-ID: <TY2PR01MB36929777D82EAE9EA4FA499CD8EE0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1604311475-15307-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1604311475-15307-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:d410:ae4c:fae8:5565]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b4e1668f-8bb5-4c6e-7b3e-08d88182ff28
x-ms-traffictypediagnostic: TYAPR01MB3935:
x-microsoft-antispam-prvs: <TYAPR01MB3935F19E5DE63B80202FEF24D8EE0@TYAPR01MB3935.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: deFXyWXSIgWqSnYwwZlrNsnq/wCGaSkPxP8AgqsmKnMP47gSdHrkhRjwOs0tmaEJs7DSIWj3Pyfm1malj5ho3TdxGJ6uQZsxrtQCuMhZcaskzuJp61lGu326Hsa3hXww0Ngq1dbz/W9o1X6hTbYAAKbuApCo9jgQV9lnEuMQfOs7HEyQlCNtfEZB3qlICJBmEpIDMYGSCtBYlDwYH35H+h6y8CTJr2xZmxRzs45DyBwlyTxnWOOTBya1s3WhLny1xwycHsRi6HBmp+6s0NhERzij707a71mP3kLwTKa2FxnOqBY+e/fS0kk40dKHwCktj9nbRi6bLLidBRVVn4X+2g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(39840400004)(136003)(366004)(8936002)(6916009)(52536014)(71200400001)(8676002)(86362001)(15650500001)(4326008)(186003)(6506007)(5660300002)(316002)(83380400001)(64756008)(54906003)(55016002)(66476007)(7696005)(76116006)(66946007)(66446008)(66556008)(9686003)(33656002)(2906002)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: afDCul7QmEZ+24aW2mYMnb3foYv7dxGijSUVB46wjQBhlsS3C8rnKLgrHmR6kS2HYQYFfIZfZa79pDIKdRUr7Ksb9StJ/nZA2dsm01JqlwqidL9QeY3QfWFO2rDFJVUfJbWHUh1Q+kqUt0JqXG7pA5GIwsxaR/XFMiuBuvfX4/LECVlp/CmetMSndjvtA3jF0VNpv2uvdnAM33zWwBJii3pyvWWpO6RQK/TYsSZfobgtfzgD7GwwF/JH3YBdvOpqU+bl/uG4GIyNGzNo7D9FIHyEj7Qm6+pJNfGadU5bbLV0iVZti14h0MTYWpUv1sDL5lv/Y2Kctkk6XD1w7CudAJLNpqga0ksia4+3QNU7I8rUK+554qWZXIW2TAC6A6n1xgh86qzNh7Sy4zLrWQilY0kBibsOH4+pem+jX1hQStOlOMLoWZSfiJCUl2qYmb5q3Xk2TCANKRraHOb+IogCCiFcf4LEmikuRcVFl0dXFgANpeqjbI8TORkpfOpJCQPnR8DX3OxWzBQy8TgXX2WL+zx76s9QuDbK8ObjczQcAtkKjy0ZqM3f0RDfeqa776g5RvKCjElT0R0wAMpOJR34xzzgTp3ELONhqeUswusTgsvA3iouYSIkKzK7KUxxwwkZ5HtGCrfceaO+zU2Bt3CUSEscfHasPhPUWTMFBdd9t82ztxEzsgkEloQYLTpZOT/6DfR2LxxY2GiKqOxOq8paHg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4e1668f-8bb5-4c6e-7b3e-08d88182ff28
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2020 12:04:49.8170
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ad8TAzd6ULn1mkv0/Aqu+Ciz8cOEkslthqha6zm+IUTpYOHKKBlAV7bX9xLkLxnQVlUylmL5nUgtSGQP+lpgiretNINqtvAMFpMUqpW51o+sQa+JqS9uz3RHV9WMx39D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3935
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Ulf,

> From: Yoshihiro Shimoda, Sent: Monday, November 2, 2020 7:05 PM
>=20
> User is possible to turn the power off after a host was removed.
> So, call _mmc_suspend() to issue the power off notification when
> a host is removing. Note that, to prevent _mmc_resume() calling
> in mmc_runtime_resume(), call mmc_card_clr_suspended() in
> mmc_remove() before mmc_remove_card(). Otherwise, _mmc_resume()
> call mmc_init_card() while removing the host.
>=20
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Changes from v1:
>  - Reuse _mmc_suspend() instead of direct mmc_poweroff_notify() calling
>   to check suspended flag while removing.

I'm afraid again, but I would like to drop this patch too because
my colleague found an issue which the following timeout happened
when we read a boot partition, and then unbind the controller.

    [  463.073168] renesas_sdhi_internal_dmac ee140000.mmc: timeout waiting=
 for hardware interrupt (CMD6)

The issue happened on the following mmc_blk_part_switch() calling.
And the function was called after _mmc_suspend() in mmc_remove() called
mmc_power_off(). So, perhaps, we should avoid mmc_power_off() calling
in mmc_remove().

As another solution, we can stop to call mmc_blk_part_switch()
in mmc_blk_remove(). However, in such case we need to modify
mmc-test driver for switching the partition [1].
---
static void mmc_blk_remove(struct mmc_card *card)
{
        struct mmc_blk_data *md =3D dev_get_drvdata(&card->dev);

        mmc_blk_remove_debugfs(card, md);
        mmc_blk_remove_parts(card, md);
        pm_runtime_get_sync(&card->dev);
        if (md->part_curr !=3D md->part_type) {
                mmc_claim_host(card->host);
                mmc_blk_part_switch(card, md->part_type);   // here
                mmc_release_host(card->host);
        }
<snip>
---

[1] According to the following commit, we need to switch the partition
before we use mmc-test driver.
---
commit ddd6fa7e794e62af3ec3eb4ffdc78489885701f2
Author: Adrian Hunter <adrian.hunter@intel.com>
Date:   Thu Jun 23 13:40:26 2011 +0300

    mmc: block: switch card to User Data Area when removing the block drive=
r

    The MMC block driver and other drivers (e.g. mmc-test) will expect
    the card to be switched to the User Data Area eMMC partition when
    they start.  Hence the MMC block driver should ensure it is that
    way when it is removed.

    Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
    Cc: Andrei Warkentin <andreiw@motorola.com>
    Signed-off-by: Chris Ball <cjb@laptop.org>
---

Best regards,
Yoshihiro Shimoda

