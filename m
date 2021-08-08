Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 655973E3A45
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  8 Aug 2021 14:50:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230354AbhHHMvD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 8 Aug 2021 08:51:03 -0400
Received: from mout.gmx.net ([212.227.15.19]:57145 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229504AbhHHMvD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 8 Aug 2021 08:51:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1628427023;
        bh=SpKTBfXmINyJsM31kZW0SjsPXsZ/8Opex1XCX37rGUM=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=AdXJLX2nB8fpHK/CnUV6GK4nXAMSigY7pojSYnNtm/+14pS502QVWuDJSiK7rtwV5
         dfyjIyCBJ1ZIopFa6ir+BCEfV0iIdexA3DsvMEqxt6BCIdkKOMu/E35zuxIwA00Cvf
         SWiEipd2dUWnk2GI8+Y+Idj/b+VD20YYPbcupsOI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([79.150.72.99]) by mail.gmx.net
 (mrgmx005 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1MFbW0-1mM5ez13oU-00H51L; Sun, 08 Aug 2021 14:50:23 +0200
From:   Len Baker <len.baker@gmx.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Santosh Shilimkar <ssantosh@kernel.org>
Cc:     Len Baker <len.baker@gmx.com>, Kees Cook <keescook@chromium.org>,
        David Laight <David.Laight@ACULAB.COM>,
        Robin Murphy <robin.murphy@arm.com>,
        linux-hardening@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 0/3] drivers/soc: Remove all strcpy() uses
Date:   Sun,  8 Aug 2021 14:50:09 +0200
Message-Id: <20210808125012.4715-1-len.baker@gmx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JA/QpiClaw4kLUAx0jzddoPZd0qTnX2YuIOC4R22ha5D+avsrP0
 hfD5HbwQT1i+QLyS34hUmZfbV0+OwvK/YuMtB/F1caBwH7WwiPFHnWHmhc+tEFVo+Khlx1r
 WHVGWYNYDLaZgss8Om0xsDSf83o09RAMuOMbS7sNzaOG9klz6gQoTTXBcoFpz2wiAbAfI2X
 x80wEaqyR3L2nftZrPsFQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WIa5A0qyMYM=:WTOz2uz2Zmef01HFaumnKB
 dd8lRmxKpnv6PWezvrwpQOLqMXJGAUAD7cfY+InnynV+v26acq9LaFbH3lGsUkV2y2ATogmUc
 yPjNVG1H548lAKX2yZ/5/XJj3GvAmW2628muangluIHU8nfRc/6jpKF9am8/03Ep3jMLXe9qb
 FlY7MrEJ/06ZClz2c59JDuDAI4XO4FBiTvV7equohupy1bOKCa6FKQH0otIp2Dch2A1K6uikY
 qODwXghsnwklK5DtnJeLNRbdG5FIF3YV6+QpHcEbHCNhu/9raX+SDDsac4uFrvHeb6/wuyUcw
 fxGPMpARX/ClXTxuGZ7dZkCD8DIgtlm2U1QNrh4mQbTvLgU12NfXt9++SDvP2Q8GCkaOGZ37T
 sGCZwR91jhVMju8ftj8cLgwPwAZ0JRUhDrif6x2GcZKWHbPTvSsGwXsbT8/lOpQ6x9fBsZxqz
 eyvCHmq51QKNb1Z10Ew3GLspejykA6SrrVm7IoaZp5cJVWEtHHkQ3PdW3QCV/rh/BPkj5XQfD
 tgTehhPHgu81WJxmKD2UMKeRNz+KswgkNj80e3s/k/vx0LWITRRbibuqivTF5pnRK0MmX0yAU
 CHe1neq8zJ4a5rk8rfqsu/S/KxnFwLFhL/EOFD4oVcjMmVS60bmm5XgVFQnYZ/PmfQEiNXpxE
 TJTVaENQD83JFUX8y3wUHEVsqJRdfGdtjNjFstWEq0Ffu6agFq+56yGOUjgMOoADIslkS2nXb
 CercwWcykI6eY6DWC6RuaR7V9CzuSHg8bOw+xegnxxJg1A/mNZ1qy2vDqA9L+W122pBCDHGdR
 S93+kBvxZaw3WqV2s9Bf11vsqiB7MCSScLxYJJtqfOV3R8Ef6LyZI6eQRaJ90/cTiW2XV/YP3
 onItyzqHvG7K2mBRMbg4poAFSzcsWFSXvGshPD9mDkufcznvhVOddguC/QYdM+eaX4JftCSAr
 hCLPivnMkWRW0O6QaKiWJIPnydv5/DsytbCAtC/QaFBz33EVDF34dTXzmfsCBaebS+5Oy1jJ2
 LRwx/L6dIscUnSbq3hf4eGtaqhzxCUaJoko7rbcvOXSMrYSpreGeN8ZYuZXLTlWIu3/3reKiZ
 9GVrbj8urkMzr3mac5Q1UDhuErin8LH2jT61mRiTZs8UhE9BUtR5n/NDA==
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

strcpy() performs no bounds checking on the destination buffer. This
could result in linear overflows beyond the end of the buffer, leading
to all kinds of misbehaviors. So use strscpy() or memcpy() as a safe
replacement.

This is a task of the KSPP [1].

Changelog v1 -> v2
- Change the "area_name_size" variable for a shorter name (Geert
  Uytterhoeven).
- Add the "Reviewed-by: Geert Uytterhoeven" tag.
- Use the memcpy function instead of strscpy function when the
  size of the destination buffer cannot be obtained with "sizeof"
  (David Laight, Robin Murphy).

Changelog v2 -> v3
- Remove the "Reviewed-by: Geert Uytterhoeven" tag since the code
  has changed after the v1 review (use of memcpy instead of
  strscpy).

Changelog v3 -> v4
- Split the changes in 3 commits (Bjorn Andersson).
- Don't break a long line (Bjorn Andersson).
- Reword the commit when used the memcpy function (Bjorn Andersson)

The previous version can be found here [2].

[1] https://github.com/KSPP/linux/issues/88
[2] https://lore.kernel.org/linux-hardening/20210801131958.6144-1-len.bake=
r@gmx.com/

Len Baker (3):
  drivers/soc/qcom: Prefer strscpy over strcpy
  drivers/soc/renesas: Prefer memcpy over strcpy
  drivers/soc/ti: Prefer strscpy over strcpy

 drivers/soc/qcom/pdr_interface.c    | 12 ++++++------
 drivers/soc/renesas/r8a779a0-sysc.c |  6 ++++--
 drivers/soc/renesas/rcar-sysc.c     |  6 ++++--
 drivers/soc/ti/knav_dma.c           |  2 +-
 4 files changed, 15 insertions(+), 11 deletions(-)

=2D-
2.25.1

