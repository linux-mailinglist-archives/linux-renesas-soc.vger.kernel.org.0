Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F36D1DC7E9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2020 09:45:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728445AbgEUHpH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 May 2020 03:45:07 -0400
Received: from mail-eopbgr1310103.outbound.protection.outlook.com ([40.107.131.103]:60557
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728375AbgEUHpG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 May 2020 03:45:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NggMi36cFRSYp5r2QhB66Wq9QZxAWuTZopM9M6at+j8bO8okULwGgbugvjrVKP9QXR+n3l+zM0Z7mEHLT+ttxZ3SEQmc3TxuZ8v9lOFnKz+QqMMC7/VAbvsIWvlhKGW9d7KbAl065FD+8RKthwvG0gql37QrPnGdCadHi3enXWNpSjw4I07yq7UHIaam8Kbkr72kl2qjRMszfuCMvkM+8poXmOUKS2zfZ7WEkpzTv8HpnTwT9qd5lLl82AfNKZUHF3dFwSvbvPhroGT6GHrD2SNkDMBSB7V+5hiK2LFez59EqHWCLNHwHOGO9u85/yJ/hI8JpjbgrEyUulxzQIH2fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E1m6K+Lz/XzzKlm//NlUjS6DMe2Ad11bOvu/vfevUNE=;
 b=Bs/4bu3ySe2+zxSkQen3G28Ve4PgR5o3LNNjU4wlA6fvIY6CzZN/UkuXCdxnejYKtsQm3EjQMG/W3flDxUxjEGICOa4PVCU45TfThks5LQdKWlQkwYWMd4Yr8pXfD1zIzhIqyjAMCrD+YqRN9CE5M5883hIfHqytPsVOnFrxJSsvxz/tMyO1WhxTqxAI5lRBNGpoOYeYCpVnZAGbYxhF9/eB1zdQVw3l1LK0STyAki9jP4d/mbzEgdomd4ss8GqW32PZYrZV9zQ11l1Xq2hEPl0kj4EoVhLweDeVGSHxcvboc1gLDCLcMgA+NkprXCoWMH2RB/9mBodrKn+WNP5a2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E1m6K+Lz/XzzKlm//NlUjS6DMe2Ad11bOvu/vfevUNE=;
 b=aczDVlWyuf1c9m0WbxRHKzXJk00QBqq7B8/ZZJjOsdjFLEhJQUiOYLeND6ITvxpKS6oHPleAfzLek0hl9P749vYnX3rJyPYZbC3sg2AYJKj8nuxuXrR4gCp8gAFJinJI/tXdFK4gEO/aCJxQSWmm0+Tq6WQkyOToYL75LF++6Wo=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2SPR01MB0032.jpnprd01.prod.outlook.com (2603:1096:404:d9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Thu, 21 May
 2020 07:44:59 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2da1:bdb7:9089:7f43]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2da1:bdb7:9089:7f43%3]) with mapi id 15.20.3000.033; Thu, 21 May 2020
 07:44:59 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>
CC:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 0/3] mmc: tmio and renesas_sdhi_internal_dmac: fix dma
 unmapping
Thread-Topic: [PATCH 0/3] mmc: tmio and renesas_sdhi_internal_dmac: fix dma
 unmapping
Thread-Index: AQHWLz2iQ8JJHLYs4USF4zCo+Q8xCqiyJ38A
Date:   Thu, 21 May 2020 07:44:59 +0000
Message-ID: <TY2PR01MB36921D805C79B829563698D6D8B70@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1590044466-28372-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1590044466-28372-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b4dfdc12-5326-4abd-9d34-08d7fd5add4d
x-ms-traffictypediagnostic: TY2SPR01MB0032:
x-microsoft-antispam-prvs: <TY2SPR01MB0032F0F86E517F91D0A09108D8B70@TY2SPR01MB0032.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 041032FF37
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DqFJmUvZja/FRXbmxBRDvZsdkK7ztNBm93fcudrvDyFPY36RCQNtzP1eTj1tm7IvATSIYa91EefaxeFby2MSjeXyMDoYTXDlNSlPTkVbEdoGfdmcGbizAwScdZiUXmXkaOLJy/2YVJuWxOJAVE5XHDGTwfB0CkVNr7eSHF6J/0DD4i9K0wF2qryDk87xgjP4VmkBtD9KnscTX1FPLi2CuSJpctgD+BquNykSDWMYsLlDcd51ZC72U8I/lvTwgqZgniQ6rmxtUtEOoiJBRIh0exRvCyWDmSPeHEYz42wZiSd4K/ZZ/svmwTLBOou95p2OjfJgCvvPWb53Me0WLI2vwQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(136003)(346002)(39860400002)(366004)(396003)(53546011)(52536014)(55236004)(26005)(9686003)(7696005)(6506007)(76116006)(86362001)(55016002)(5660300002)(66946007)(66476007)(66556008)(66446008)(64756008)(186003)(71200400001)(110136005)(54906003)(33656002)(2906002)(4326008)(8936002)(8676002)(478600001)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: QsRq1TXDTMnFBOaHD4SxslX9bj3/sY1ALRy7wC3lCO6hn4c8863li9DZ03ssEbrTsP1YuBzLQLJl2pmETuogASrHdWu5tEuJrofCXTqVepKs1mwdanLHY5ZXl/+EOd/HNAE1m+CgBl4jzuNOSH9HI4uZSsL3M/dLBytlImtNkpbnz5ZfgrWf7QyuoNMSEf4LRpnknKuv5kQ+ES/hTqHtdWe3YC0jMqxtnqxvQihzV2gPJntQFhJu3NkCkd2OczGKOc4pwiVADZcRUtYZ/B0hFmLbQuv5Jve7W3UkWjvSW+cbEZfeuQ2hN0tt0XfRouUbIUxm0sdu39jsySYNgh2+BzO7SLjA1v47eP+nDqbRgU9BsvzRG2ICNUCSGMSPpVybFreI3+NIXJdVAkbPPNHJvKcQEY/M95I8UEQvSURD670uZooVuMvfjvaSt1PfiAjLWK6fZFxLJ8bleV5sIFi8bGqj88GVw+xyZLsMeyvDjqkezRjs9nuACrd7EE4NG+27
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4dfdc12-5326-4abd-9d34-08d7fd5add4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2020 07:44:59.6890
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CdRuJuG+nmYatV2macom/BMycPlSxDGkqWRRPvubI6ALUjDpZ7AdzNN4VUoGm32nwbbsoHUaAx6ipkeY+U4bqZOahuRNe8rled5M/k/3XkARFjiGASv/z9z0u0m/Uy6P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2SPR01MB0032
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi again,

> From: Yoshihiro Shimoda, Sent: Thursday, May 21, 2020 4:01 PM
> To: ulf.hansson@linaro.org; wsa+renesas@sang-engineering.com
> Cc: linux-mmc@vger.kernel.org; linux-renesas-soc@vger.kernel.org; Yoshihi=
ro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Subject: [PATCH 0/3] mmc: tmio and renesas_sdhi_internal_dmac: fix dma un=
mapping
>=20
> This patch series is based on mmc.git / next branch.

Note that this patch series is tested by using additional debug code [1],
because there is difficult to reproduce this issue. Before apply patch,
When I enabled CONFIG_DMA_API_DEBUG and CONFIG_DMA_API_DEBUG_SG,
I observed lacking dma unmapping on /sys/kernel/debug/dma-api/dump.
And then I confirmed the patch can fix the issue.

---
[1]
diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
index adc2bf7..1df00f6 100644
--- a/drivers/mmc/host/tmio_mmc.h
+++ b/drivers/mmc/host/tmio_mmc.h
@@ -192,6 +192,7 @@ struct tmio_mmc_host {
 	void (*hs400_complete)(struct tmio_mmc_host *host);
=20
 	const struct tmio_mmc_dma_ops *dma_ops;
+	int debug;
 };
=20
 struct tmio_mmc_host *tmio_mmc_host_alloc(struct platform_device *pdev,
diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_c=
ore.c
index 946fb01..f8fe905 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -552,7 +552,8 @@ static void tmio_mmc_cmd_irq(struct tmio_mmc_host *host=
, unsigned int stat)
 		cmd->resp[0] =3D cmd->resp[3];
 	}
=20
-	if (stat & TMIO_STAT_CMDTIMEOUT)
+	host->debug++;
+	if (stat & TMIO_STAT_CMDTIMEOUT || !(host->debug & 0xff))
 		cmd->error =3D -ETIMEDOUT;
 	else if ((stat & TMIO_STAT_CRCFAIL && cmd->flags & MMC_RSP_CRC) ||
 		 stat & TMIO_STAT_STOPBIT_ERR ||

