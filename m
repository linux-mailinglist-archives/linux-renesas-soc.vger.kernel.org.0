Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EDED3A3D63
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Jun 2021 09:41:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231593AbhFKHnz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Jun 2021 03:43:55 -0400
Received: from mail-vk1-f181.google.com ([209.85.221.181]:45805 "EHLO
        mail-vk1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231584AbhFKHny (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jun 2021 03:43:54 -0400
Received: by mail-vk1-f181.google.com with SMTP id az3so2337756vkb.12
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Jun 2021 00:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7BMBgcaQkIy6hi8BSu350kxdTkBNAY3Dq0E/7PDsLj8=;
        b=iG1cQQIMcHuwSWQ+rNsUs9g7wtXLSpwIinjlEQ8VM1UofbRvvDwgkCbkyfezeYtr1a
         22zlobVGclILohJ7MizBhY6PpUGOctvY19f0ssO/lNLwiVgCtNdb1ZKXeV39JmrMHGN4
         KnsxW1NfQ2pbq69yRsPOm6VCSHLq53nEXLKYa5bRzZSuybdUVMjZzeno1MYtqqVTbhKF
         YTl78XXAbNcQWcOGrzbyUXyFjxSvH6How0CYwgz4CQB3lKAw6HToDQDpRnds/1Z/mN9G
         VaWbwcAcLnstIbmS3007HYqXrxaCk8O7BGYNZTYAC3HU40fM1XBcPb+DSYMJf+WzUVwP
         671A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7BMBgcaQkIy6hi8BSu350kxdTkBNAY3Dq0E/7PDsLj8=;
        b=Q1yf4zlYqMRHUMg6nn1vFwD9BZPwUSvjZHLUN1F2wA6xHvIiAsmLyDGIolXYI1PgSU
         SX9pcv/4qIVseLx5AbptTBgPAAkbaXrnAM+OnVmW61Scp/9eL4n9h0S5u6PKE8O80PtV
         KPos3sMFco/uGwjSx0APffe3cyRBOVH1ON7Q3vYps8V6oyPhvo2vvqJAEnN0YnSwlEWW
         4FqAFOAu+2qp+5OvLvLMxvWgKu+Fq49ieaTXkZzCUDjTwyCN6t0E3FgnAS2E0WGuhvqY
         xn3lT5rG/Nk6d+Y33OCkjddlUxmZvUrRPHsDe1XCsBoPrMiJ+wicjbKZNkE5OZ+lAkSX
         DL4Q==
X-Gm-Message-State: AOAM530rcmw4Iud4zBS7TWTI8LL0MAZeMDsPFGGypAy+xDTDEbFurkSP
        jDNeE6yqlC+AnfGCE+hIxbQ57O9m67r0WR/3G/PfW9WhbDHp/w==
X-Google-Smtp-Source: ABdhPJzYFjnUJfjcecFeffgyAl+T1TTZtfAeYeSZF4bDlzBX1j7sW3LDiD+cf0qyzf++dPRhruwXOCBYPAB7oVBgQZI=
X-Received: by 2002:ac5:c7c3:: with SMTP id e3mr8051851vkn.6.1623397256690;
 Fri, 11 Jun 2021 00:40:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210608180620.40059-1-wsa+renesas@sang-engineering.com> <YL/voNtxiqvoQYOS@oden.dyn.berto.se>
In-Reply-To: <YL/voNtxiqvoQYOS@oden.dyn.berto.se>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 11 Jun 2021 09:40:20 +0200
Message-ID: <CAPDyKFqEzvCibcNBK5vUYHA=x981PrANPUUWReX6jXaYAD65Eg@mail.gmail.com>
Subject: Re: [RFC PATCH] mmc: improve function name when aborting a tuning cmd
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 9 Jun 2021 at 00:33, Niklas S=C3=B6derlund
<niklas.soderlund@ragnatech.se> wrote:
>
> Hallo Wolfram,
>
> Thanks for your work.
>
> On 2021-06-08 20:06:20 +0200, Wolfram Sang wrote:
> > 'mmc_abort_tuning()' made me think tuning gets completely aborted.
> > However, it sends only a STOP cmd to cancel the current tuning cmd.
> > Tuning process may still continue after that. So, rename the function t=
o
> > 'mmc_send_abort_tuning()' to better reflect all this.
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> Reviewed-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se=
>

Applied for next, thanks!

Kind regards
Uffe


>
> > ---
> >
> > Ulf, here is the patch we discussed earlier today. Based on mmc/next.
> >
> >  drivers/mmc/core/mmc_ops.c           | 4 ++--
> >  drivers/mmc/host/renesas_sdhi_core.c | 2 +-
> >  drivers/mmc/host/sdhci.c             | 2 +-
> >  include/linux/mmc/host.h             | 2 +-
> >  4 files changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/mmc/core/mmc_ops.c b/drivers/mmc/core/mmc_ops.c
> > index 3c58f6d0f482..973756ed4016 100644
> > --- a/drivers/mmc/core/mmc_ops.c
> > +++ b/drivers/mmc/core/mmc_ops.c
> > @@ -700,7 +700,7 @@ int mmc_send_tuning(struct mmc_host *host, u32 opco=
de, int *cmd_error)
> >  }
> >  EXPORT_SYMBOL_GPL(mmc_send_tuning);
> >
> > -int mmc_abort_tuning(struct mmc_host *host, u32 opcode)
> > +int mmc_send_abort_tuning(struct mmc_host *host, u32 opcode)
> >  {
> >       struct mmc_command cmd =3D {};
> >
> > @@ -723,7 +723,7 @@ int mmc_abort_tuning(struct mmc_host *host, u32 opc=
ode)
> >
> >       return mmc_wait_for_cmd(host, &cmd, 0);
> >  }
> > -EXPORT_SYMBOL_GPL(mmc_abort_tuning);
> > +EXPORT_SYMBOL_GPL(mmc_send_abort_tuning);
> >
> >  static int
> >  mmc_send_bus_test(struct mmc_card *card, struct mmc_host *host, u8 opc=
ode,
> > diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/re=
nesas_sdhi_core.c
> > index baab4c2e1b53..e49ca0f7fe9a 100644
> > --- a/drivers/mmc/host/renesas_sdhi_core.c
> > +++ b/drivers/mmc/host/renesas_sdhi_core.c
> > @@ -704,7 +704,7 @@ static int renesas_sdhi_execute_tuning(struct mmc_h=
ost *mmc, u32 opcode)
> >                       set_bit(i, priv->smpcmp);
> >
> >               if (cmd_error)
> > -                     mmc_abort_tuning(mmc, opcode);
> > +                     mmc_send_abort_tuning(mmc, opcode);
> >       }
> >
> >       ret =3D renesas_sdhi_select_tuning(host);
> > diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> > index bf238ade1602..6aaf5c3ce34c 100644
> > --- a/drivers/mmc/host/sdhci.c
> > +++ b/drivers/mmc/host/sdhci.c
> > @@ -2680,7 +2680,7 @@ void sdhci_abort_tuning(struct sdhci_host *host, =
u32 opcode)
> >
> >       sdhci_end_tuning(host);
> >
> > -     mmc_abort_tuning(host->mmc, opcode);
> > +     mmc_send_abort_tuning(host->mmc, opcode);
> >  }
> >  EXPORT_SYMBOL_GPL(sdhci_abort_tuning);
> >
> > diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
> > index c7e7b43600e9..0abd47e9ef9b 100644
> > --- a/include/linux/mmc/host.h
> > +++ b/include/linux/mmc/host.h
> > @@ -632,6 +632,6 @@ static inline enum dma_data_direction mmc_get_dma_d=
ir(struct mmc_data *data)
> >  }
> >
> >  int mmc_send_tuning(struct mmc_host *host, u32 opcode, int *cmd_error)=
;
> > -int mmc_abort_tuning(struct mmc_host *host, u32 opcode);
> > +int mmc_send_abort_tuning(struct mmc_host *host, u32 opcode);
> >
> >  #endif /* LINUX_MMC_HOST_H */
> > --
> > 2.30.2
> >
>
> --
> Regards,
> Niklas S=C3=B6derlund
