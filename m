Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BACD1EE44B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jun 2020 14:17:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728076AbgFDMRQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 Jun 2020 08:17:16 -0400
Received: from mail-eopbgr1310129.outbound.protection.outlook.com ([40.107.131.129]:39872
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727944AbgFDMRQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Jun 2020 08:17:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iwTPwe1df1m4TWfcPdPCwMK4kKO6rSnGMeyzhNFky4Rxjgu+1rR7KJHCd7He8E//jyUz2a8c7sKo349UudaWpgfdR1ujdxtvnK0pKxj1XGTC+F7vdjvH0+8WHZ45DltY8eEho653ofz8lBuKvoGbYWZuoRvyDYwPyhGhPDNEaFhuVDaQHGyO0nt+GIgfgWQx5G0ZU+k6BUOi8r0L8qusI4a97EAI6VobJFsjWjmKEAlpujBXzqNJJECr0rljyPTXGRO/wWtPk9ef18i7ZfSPGlGiH9ffkXOjlH1eYpGsdprD74qhaF2IBu4b6dOrvAWmvo8J48lH3gF97YeF7sxfZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3MxiT5bxDTqnH+F0FiypGLr8MAexWyO6XHTNf8Aocos=;
 b=flr+MDxbObJJmUJ+LJdlPrNCxOcYXtdwAqcgfN1Hay6h+UEN6FYUCdIxl2FHruPlKindXzKJIewNyy8CvLUX12EES5oIBxNHV4QL0T/BQvePrpg256B5C6ebHtDfkRgg5sc4DYZE0/sHFz0IwNUjGn/KoJ21IqKYmvZXQ17gbaQD7pNTr+bpd2SdcGhGpppbpoeFNMcn4c5r3F1amlTBAy6s3RTJVXC7Q3kONFh4pNWkp+NWPc4cteEYuGtHImKLjlsUI0HQjZdqaWVi88Oky+SlRMnm+jRK7obzDZsy+X3u4r8bXbTREmKlLmspFfAhT3njJNEdjHbUvh952ex2Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3MxiT5bxDTqnH+F0FiypGLr8MAexWyO6XHTNf8Aocos=;
 b=qG61snC1oZIskoJ8P5gi46AjUZUUUhzObONRuFJCPSD6rNlWVmP0IyffJAKifHwbyjowYghfHlut/O7NPcrjkWCyeav+xAD0SEoxHpgSwPJ2F+Q+M/sdMLrqER/s75ecmMippbVvV7o39frsDSvirkBHgHbMYOtg8se/Q+dZkxk=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB2844.jpnprd01.prod.outlook.com (2603:1096:404:70::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.25; Thu, 4 Jun
 2020 12:17:11 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2da1:bdb7:9089:7f43]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2da1:bdb7:9089:7f43%3]) with mapi id 15.20.3066.018; Thu, 4 Jun 2020
 12:17:11 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>
CC:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH/RFC] mmc: core: Issue power_off_notify for eMMC
 Suspend-to-RAM
Thread-Topic: [PATCH/RFC] mmc: core: Issue power_off_notify for eMMC
 Suspend-to-RAM
Thread-Index: AQHWLdFW4LWb0SXvbUyfh/OMYFhgGajIc4Jw
Date:   Thu, 4 Jun 2020 12:17:11 +0000
Message-ID: <TY2PR01MB3692FD4D8058D5EEFC761D47D8890@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1589887988-7362-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1589887988-7362-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1edacf1b-72fa-49f9-a32b-08d808813554
x-ms-traffictypediagnostic: TY2PR01MB2844:
x-microsoft-antispam-prvs: <TY2PR01MB2844A2FD16412E9E0EDA0E7AD8890@TY2PR01MB2844.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1013;
x-forefront-prvs: 04244E0DC5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BXkX1iVNTt3XknQYcSFezs9iwrytI+HSit3rbmc0L227AMF1A37lywVPp91dUyonO8cHRYmQqN9WXJlh8GPxAZbo01TqBoAD5PgrJuf7qtDFegOvqqU3M4xZJcKfiQXLena2rfabkJuOof1HnK6I728vB/d+H7CnmqZxjH5HZRLXA0JE6h3cNvsGsBFWBZUrRGLrY5tTStV+t6T4lbItSxj/8mFB21cTEu6bsLVwLM2lvDw/pkTLGS6CmRUkhi6eCw6q5hlBpyZrn2Bkb5WhpIfir3FduE8VdSzMrFAfHzELIy9CbXn+qyo+GO46lI7R
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(396003)(136003)(39860400002)(346002)(376002)(478600001)(86362001)(2906002)(83380400001)(8936002)(9686003)(8676002)(55016002)(5660300002)(4326008)(33656002)(6916009)(64756008)(66556008)(316002)(54906003)(26005)(71200400001)(186003)(66476007)(7696005)(15650500001)(66946007)(52536014)(66446008)(6506007)(55236004)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: HlBSxMwqJ23WuktMyB+xEwyAuFggO8NoLKpWHMaQxJdyPX7bTvkf97Jzx4Vm1RRhUnyJJxF/fBbAtiZ04wtzh/suTRyfJutH14Bd9b6/O8S5ujJ2WiaNaUdJn9g/jhjJpXiHMbqFfUIJ/NsGBl2mn6gYizrT7U32ce2mODVbbwnHdaN1M9YODfJTgeBWACxvZCmrA0j00wWB2q2Rj8Em9YNMqiokvcAhrWLPZLyjVX9DNTFFfaAopVz+suMi6AF/H+/e1Hg+oVMBgTmZM4AKE0Z7SdFAjuGmzOuBi1ykuI8w6i15QL5vWUBym2ZCQSPXB83CNsW4go4hqh7pgHQv6pB2OTsB8jTPJ/nOmr6yvokoh/K4SJ3hotkLK+EqulRHgUDkXougnt+BMly/qmhkp9GzbUdTkAROKdwI5rS70cQPEiwQsxt/6MXsMXOGyyRKahzmy4hNJshzn70voWG4Gx6bbBXu5Z70vnX8pfcqHYYJexDaLUCXEfZHcb8i1RDn
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1edacf1b-72fa-49f9-a32b-08d808813554
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2020 12:17:11.0468
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iW/L7z+p7ZX9qaBnMBAiP0oxQ5tfrXpBaS+LCN/11/eov6zD3LfqYm6Elv6tfTLcVxmwSQaoB7BMe+tImfkqCl1ox6EdM5qvpg9MFyo2DqSM2jjh8xSUgeQWsm/DYDiv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2844
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi again,

> From: Yoshihiro Shimoda, Sent: Tuesday, May 19, 2020 8:33 PM
>=20
> The commit 432356793415 ("mmc: core: Enable power_off_notify for
> eMMC shutdown sequence") enabled the power off notification
> even if MMC_CAP2_POWEROFF_NOTIFY (MMC_CAP2_FULL_PWR_CYCLE now) is
> not set. However, the mmc core lacks to issue the power off
> notificaiton when Suspend-to-{RAM,Disk} happens on the system.
>=20
> So, add Suspend-to-RAM support at first because this is easy to
> check by using pm_suspend_target_state condition on _mmc_suspend().
>=20
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

I'd like to add more detail why this patch is needed.
I think we should think some events (which are Shutdown, Suspend-to-idle,
Suspend-to-RAM) for the Power off Notification control.
I described these events like below.

Assumption of the host : MMC_CAP2_FULL_PWR_CYCLE=3Dfalse
Assumption of the eMMC : in POWERED_ON

1) Event  : Shutdown
- power   : going to VCC=3DOFF & VCCQ=3DOFF
- ideal   : Either POWER_OFF_LONG or POWER_OFF_SHORT
- current : POWER_OFF_LONG --> Perfect
- Remarks : the commit 432356793415

2) Event  : Suspend-to-Idle
- power   : Keep VCC=3DON & VCCQ=3DON
- ideal   : issue MMC_SLEEP_AWAKE and keep the power (because the host coul=
d not change VCC=3DOFF)
- current : issue MMC_SLEEP_AWAKE and keep the power --> Perfect
- Remarks : IIUC, even if the eMMC is in POWERED_ON, a host can issue CMD5 =
(sleep).

3) Event  : Suspend-to-RAM
- power   : going to VCC=3DOFF & VCCQ=3DOFF
- ideal   : Either POWER_OFF_LONG or POWER_OFF_SHORT (because the same as t=
he "Shutdown" event)
- current : issue MMC_SLEEP_AWAKE --> NG
- Remarks : So, I tried to fix this by the patch.

In addition, we should also think about the event of unbind.

4) Event  : Unbind
- power   : Keep VCC=3DON & VCCQ=3DON
- ideal   : NO_POWER_NOTIFICATION because user is possible to turn the powe=
r off
- current : Keep POWERED_ON --> NG
- Remarks : But, I didn't try to fix this yet.

Best regards,
Yoshihiro Shimoda

