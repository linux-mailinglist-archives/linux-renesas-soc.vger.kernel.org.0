Return-Path: <linux-renesas-soc+bounces-30552-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Kb6He1QyWnrxQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30552-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Mar 2026 18:18:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE03352D7C
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Mar 2026 18:18:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A316E300C81E
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Mar 2026 16:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D0D136EAB5;
	Sun, 29 Mar 2026 16:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FrzopNnu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD6F279DCA
	for <linux-renesas-soc@vger.kernel.org>; Sun, 29 Mar 2026 16:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774801130; cv=pass; b=RS+C8C8/1poDROdqBwPSgzYr7bH9Hp/crLEX0xtfKimifFFLynT1EuDTYVe6znumlehO1hzRV/N7boS2dgQM4JzplnHhUX1bxMocEiyZILtmGckhrd5JI5Ww5MzNTXfLaWYWOMHKOtCE4R10KmMhER5EFQk27jWyh3e2qfaOpPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774801130; c=relaxed/simple;
	bh=xQqCvaSYvMDehLMpCAi2Exo2F9/DzAf4RUjSbu4AXqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H+W0ulMeKyrH4zHwGuOELdrm3YQ+1v2nDp6PXPeyd015g/yuIyQkOaw6SWFIKDv2GwLj2Cov/ELppYEsxhN1j/ZnCDL2ij+9jZY2h/6b0N/p1kdiOHhDfDygrQbln0XMUTRH/bMiQyii8wU11uDlqjJ3NMJ9HpwjKQ7NX/yxtDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FrzopNnu; arc=pass smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-46a9ae3f857so442272b6e.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 29 Mar 2026 09:18:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774801127; cv=none;
        d=google.com; s=arc-20240605;
        b=GlsO2rlh16br3DkolBc+gCNVzVsNt1GL+Aox3deRGaSgmt/mliVneqRSYc3AcA8QEk
         gv6FDg6EOgY9yeUnyg2cugh2LlfEMectQRTVvyjbVbd/nzUQAiC+7E3CARZQjEwwDH0Q
         vOZzujeaxcUH1ucTCurpQqKOZHTSeptNfqVaN+ujpZ8Fx72B5XVyOKyg7buGY1XyVvmo
         D5PdUarZgaKwTbk01CS/06B1/VlXiP344tFiFUuLT5HPGoFgzmMIsyJWz2xeMAKk9D/M
         Bbj/vGCQ78jE3QFYOKgt7+3U0jbT3Px68Laj0OuBxoci09aqKeYn/GyjMcqGdpHif4jW
         ur8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WxRWrohRC+fNvhhMsjBNKWfMlLneWiOcUehlHfN3ctw=;
        fh=O+8CMsZrj/5P+F2TZ3NGUlIIspTaDbXFp0V04Hd8tqw=;
        b=Xlddkedyr6m9UWPRmmaQXBojXU/r5XW/sp9D/HEoeFB14z2vHriG9Gll9cDIHCenc/
         V37OQqijO1GHQBMdgYapBqAp4L032/JUx1K6z2p8hRFvYrZL40nh4OD7ICi1wKZ6KQlt
         mmcDB5DmOehFL/8FQHks+nRlCRoaAl64W4ezlqlYQ6R4a+6LpEk/0JLT3dU8YKYiCvK4
         SbV4AtKl0GJDqKgCv65REMcu0ACal3rWvLQ+xAseRWBmCjyRmTm0Fr0lKvyzr8jvSnSJ
         asg+7vfJuxHFMYH2XB4go5DlMH/sEIwpupLM5f6mFcFAbr4U7wDicqx2ZnbOxdIIQpml
         DmpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774801127; x=1775405927; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WxRWrohRC+fNvhhMsjBNKWfMlLneWiOcUehlHfN3ctw=;
        b=FrzopNnu1K3dOdZ3TusFe8IBsytL0sNJAtbEJkAi2Ep8ulCYvIgLXG4+vwzGZL2WTj
         dcNudB5wUTfvIW5re3cUZG1++D3fhNZHa7genkw4HI1c7csQf1RXcAHwTh5tuOB3y5Ac
         NhqgOzqMP+I9e1gDGtW9RHi0h9GiWlGWkoV8VZ9vMGW20CnRMLgxv93uoi+zKLL5PqT7
         lihAloiFoH2AGTujWWUiAFI749sAv2zVeMRfU/ziSpIjWTK5dBcrG6sRO3MGavZt6fU9
         E6j+o3xX2I0lIFURRwKtsQcu1qw4zO3iHzPjhkW81uQG0TxQUR40RLPD0mgcCnrfoU6b
         yfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774801127; x=1775405927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WxRWrohRC+fNvhhMsjBNKWfMlLneWiOcUehlHfN3ctw=;
        b=qlXApEdDW0iJ8gkKC30/XnFGY3lfw0paQdGarevwkPS3fzHF/NVXt2JYSW2E9o/aAk
         dayFbGLc83oID3GdNmnklUN7l9tCqI/L/3bBk0g7n84URfriyhvgRSIBQAeAF6FUhLeU
         qi2imD/nLM7HD+mtKf8Bfbfn6tJ/81VMvAhIV4/9rOh0G8hImaZ/LRF05i1cOAOM8CwF
         RNOXLBRwIpq9IU9cw2VSSGrhzcC2dSkZqq/OyJUuV5WL/Pcxpxkiad4E82krEhEFurx5
         VF3MSMHRHSOpEEbSu3Wc93AJa/vn3p1KBI5IQgMq4Gz4kHodFrIocd/gwb6dSngtapCE
         Hn9A==
X-Gm-Message-State: AOJu0Yy5Baqdn+yspwUbdgD2/VaT2bo+xoOQTh1+Jn8lyHvgS8CDji0n
	2J8hUZE5YnBdhar3JvrF9HeXuD8zP7OejvA8Zxxp7e3uRnhtu/qoIFcai+3T6DYHcg1JKenhTtl
	ozeLO+5ripK9veld8JMh/DB1LgGgpgvM=
X-Gm-Gg: ATEYQzzLjGwRzkA/vraQK9qHS2z/Dd8us3+K0HA5O0m17z1VUzBD97MHtzMMDgdhx58
	847Q8Kop86F+q+mYAqFOJ/IKI2UU10TfbwWC+1El+jOAE1MeNceq4FRlwuoQ9DFAJAA8etLZ2Cr
	Mwzzsoisz+oxtbk3ZZr6V9EhD5y24Az8D1so/yRG+W5bNjoNgLqFVrfkhk6QndazCRGOUmrFj/j
	dV9CcFE/OLFhFCmiwZR/J09RLRuZ1sMt8KDV7+TJt/JWg4v6ZfwkDNxMbB8BKxYyn/M8W/RnlsO
	sdv+IJ40
X-Received: by 2002:a05:6808:1909:b0:466:f25d:3281 with SMTP id
 5614622812f47-46a8a535f24mr4527393b6e.29.1774801127539; Sun, 29 Mar 2026
 09:18:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327151112.5202-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260327151112.5202-2-wsa+renesas@sang-engineering.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 29 Mar 2026 11:18:36 -0500
X-Gm-Features: AQROBzAT0Y7MQA0Vu0exbVKBXS_ASbnND8ZlhVVTpfO0frVJ0Okq55qzNtMBYvo
Message-ID: <CABb+yY3J2T5c4=dGaqPYi3L=88zgTqRn6AJwxBJ9Sqx6aDH8jw@mail.gmail.com>
Subject: Re: [PATCH v3] mailbox: remove superfluous internal header
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Sudeep Holla <sudeep.holla@kernel.org>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Peter Chen <peter.chen@cixtech.com>, 
	Fugang Duan <fugang.duan@cixtech.com>, 
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-acpi@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30552-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,nxp.com,cixtech.com,pengutronix.de,gmail.com,nvidia.com,lists.infradead.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jassisinghbrar@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sang-engineering.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:email]
X-Rspamd-Queue-Id: DFE03352D7C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 10:11=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Quite some controller drivers use the defines from the internal header
> already. This prevents controller drivers outside the mailbox directory.
> Move the defines to the public controller header to allow this again as
> the defines are not strictly internal anyhow.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>
> Changes since v2:
> * rebased to 7.0-rc5
> * add tag (Thanks, Daniel!)
>
>  drivers/mailbox/cix-mailbox.c      |  2 --
>  drivers/mailbox/hi3660-mailbox.c   |  2 --
>  drivers/mailbox/imx-mailbox.c      |  2 --
>  drivers/mailbox/mailbox-sti.c      |  2 --
>  drivers/mailbox/mailbox.c          |  2 --
>  drivers/mailbox/mailbox.h          | 12 ------------
>  drivers/mailbox/omap-mailbox.c     |  2 --
>  drivers/mailbox/pcc.c              |  2 --
>  drivers/mailbox/tegra-hsp.c        |  2 --
>  include/linux/mailbox_controller.h |  5 +++++
>  10 files changed, 5 insertions(+), 28 deletions(-)
>  delete mode 100644 drivers/mailbox/mailbox.h
>
> diff --git a/drivers/mailbox/cix-mailbox.c b/drivers/mailbox/cix-mailbox.=
c
> index 443620e8ae37..864f98f21fc3 100644
> --- a/drivers/mailbox/cix-mailbox.c
> +++ b/drivers/mailbox/cix-mailbox.c
> @@ -12,8 +12,6 @@
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>
> -#include "mailbox.h"
> -
>  /*
>   * The maximum transmission size is 32 words or 128 bytes.
>   */
> diff --git a/drivers/mailbox/hi3660-mailbox.c b/drivers/mailbox/hi3660-ma=
ilbox.c
> index 17c29e960fbf..9b727a2b54a5 100644
> --- a/drivers/mailbox/hi3660-mailbox.c
> +++ b/drivers/mailbox/hi3660-mailbox.c
> @@ -15,8 +15,6 @@
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>
> -#include "mailbox.h"
> -
>  #define MBOX_CHAN_MAX                  32
>
>  #define MBOX_RX                                0x0
> diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.=
c
> index 003f9236c35e..22331b579489 100644
> --- a/drivers/mailbox/imx-mailbox.c
> +++ b/drivers/mailbox/imx-mailbox.c
> @@ -23,8 +23,6 @@
>  #include <linux/slab.h>
>  #include <linux/workqueue.h>
>
> -#include "mailbox.h"
> -
>  #define IMX_MU_CHANS           24
>  /* TX0/RX0/RXDB[0-3] */
>  #define IMX_MU_SCU_CHANS       6
> diff --git a/drivers/mailbox/mailbox-sti.c b/drivers/mailbox/mailbox-sti.=
c
> index b4b5bdd503cf..b6c9ecbbc8ec 100644
> --- a/drivers/mailbox/mailbox-sti.c
> +++ b/drivers/mailbox/mailbox-sti.c
> @@ -21,8 +21,6 @@
>  #include <linux/property.h>
>  #include <linux/slab.h>
>
> -#include "mailbox.h"
> -
>  #define STI_MBOX_INST_MAX      4      /* RAM saving: Max supported insta=
nces */
>  #define STI_MBOX_CHAN_MAX      20     /* RAM saving: Max supported chann=
els  */
>
> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
> index e63b2292ee7a..9d41a1ab9018 100644
> --- a/drivers/mailbox/mailbox.c
> +++ b/drivers/mailbox/mailbox.c
> @@ -18,8 +18,6 @@
>  #include <linux/property.h>
>  #include <linux/spinlock.h>
>
> -#include "mailbox.h"
> -
>  static LIST_HEAD(mbox_cons);
>  static DEFINE_MUTEX(con_mutex);
>
> diff --git a/drivers/mailbox/mailbox.h b/drivers/mailbox/mailbox.h
> deleted file mode 100644
> index e1ec4efab693..000000000000
> --- a/drivers/mailbox/mailbox.h
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -
> -#ifndef __MAILBOX_H
> -#define __MAILBOX_H
> -
> -#include <linux/bits.h>
> -
> -#define TXDONE_BY_IRQ  BIT(0) /* controller has remote RTR irq */
> -#define TXDONE_BY_POLL BIT(1) /* controller can read status of last TX *=
/
> -#define TXDONE_BY_ACK  BIT(2) /* S/W ACK received by Client ticks the TX=
 */
> -
> -#endif /* __MAILBOX_H */
> diff --git a/drivers/mailbox/omap-mailbox.c b/drivers/mailbox/omap-mailbo=
x.c
> index d9f100c18895..5772c6b9886a 100644
> --- a/drivers/mailbox/omap-mailbox.c
> +++ b/drivers/mailbox/omap-mailbox.c
> @@ -22,8 +22,6 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/mailbox_controller.h>
>
> -#include "mailbox.h"
> -
>  #define MAILBOX_REVISION               0x000
>  #define MAILBOX_MESSAGE(m)             (0x040 + 4 * (m))
>  #define MAILBOX_FIFOSTATUS(m)          (0x080 + 4 * (m))
> diff --git a/drivers/mailbox/pcc.c b/drivers/mailbox/pcc.c
> index 22e70af1ae5d..636879ae1db7 100644
> --- a/drivers/mailbox/pcc.c
> +++ b/drivers/mailbox/pcc.c
> @@ -59,8 +59,6 @@
>  #include <linux/io-64-nonatomic-lo-hi.h>
>  #include <acpi/pcc.h>
>
> -#include "mailbox.h"
> -
>  #define MBOX_IRQ_NAME          "pcc-mbox"
>
>  /**
> diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
> index ed9a0bb2bcd8..2231050bb5a9 100644
> --- a/drivers/mailbox/tegra-hsp.c
> +++ b/drivers/mailbox/tegra-hsp.c
> @@ -16,8 +16,6 @@
>
>  #include <dt-bindings/mailbox/tegra186-hsp.h>
>
> -#include "mailbox.h"
> -
>  #define HSP_INT_IE(x)          (0x100 + ((x) * 4))
>  #define HSP_INT_IV             0x300
>  #define HSP_INT_IR             0x304
> diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_c=
ontroller.h
> index 80a427c7ca29..16fef421c30c 100644
> --- a/include/linux/mailbox_controller.h
> +++ b/include/linux/mailbox_controller.h
> @@ -3,6 +3,7 @@
>  #ifndef __MAILBOX_CONTROLLER_H
>  #define __MAILBOX_CONTROLLER_H
>
> +#include <linux/bits.h>
>  #include <linux/completion.h>
>  #include <linux/device.h>
>  #include <linux/hrtimer.h>
> @@ -11,6 +12,10 @@
>
>  struct mbox_chan;
>
> +#define TXDONE_BY_IRQ  BIT(0) /* controller has remote RTR irq */
> +#define TXDONE_BY_POLL BIT(1) /* controller can read status of last TX *=
/
> +#define TXDONE_BY_ACK  BIT(2) /* S/W ACK received by Client ticks the TX=
 */
> +
>  /**
>   * struct mbox_chan_ops - methods to control mailbox channels
>   * @send_data: The API asks the MBOX controller driver, in atomic
> --
> 2.51.0
>
Applied to mailbox/for-next
Thanks
Jassi

