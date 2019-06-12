Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3542141DE8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 09:38:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731566AbfFLHih (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 03:38:37 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33728 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731538AbfFLHih (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 03:38:37 -0400
Received: by mail-lj1-f196.google.com with SMTP id h10so8313281ljg.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Jun 2019 00:38:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bnmXT9mmOWV+x7GAg5lcfCPJbqSVqRhbaGL9wYjiOi0=;
        b=k2sANHY8MOhCn51JMeDL1906ZX40Z9uVVfAuMGScpy1ZqiqVxjS8HaJl/E3Eu+CmSM
         oAqOmQ6cYylTbPGpPTB2Y0Cc9670ltQaeATI+Esx624sE2l4Ehj4iVKuT1lhRwWxRKxZ
         iF35MS6NCFBAzKxLBK4G7W2JOEfQpDdDk8FdBt22Cz25TYSfFxcJpt/pwyhTygsPJFpd
         2Cm9VvKgrTstpnm2MWh/NwURleJazOFTQ9xV2ciqde5TUEvqNYbvY8IHs9XzPsKi/Frz
         iqBP7KEoAzqMJrUyZXWKK3uXKM1lgty0VwwvFMpYotmhroQXP8qoaj5YK7WAPZEsL+hE
         4JWA==
X-Gm-Message-State: APjAAAWmSDF2VDEPbjNx511dwQWDqEw4i5pDCxeAVwY31FFSVtd1hN6l
        Eyp1u6E8yulFxkbDcP1lwATnebn0pKdHSOd/B2M=
X-Google-Smtp-Source: APXvYqxqRLtQL9Co5rZxDEv0QL+XIRKJtD8OXVS6oAdkU2zQaiDyUtWDgJdrV1nNYoZ5IuDhR4ZnxuLvd5BeCDAvhxA=
X-Received: by 2002:a2e:989a:: with SMTP id b26mr13664039ljj.31.1560325115605;
 Wed, 12 Jun 2019 00:38:35 -0700 (PDT)
MIME-Version: 1.0
References: <1559918173-30577-1-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1559918173-30577-1-git-send-email-ykaneko0929@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 12 Jun 2019 09:38:22 +0200
Message-ID: <CAMuHMdVk7XX3Ugy5KYwd-A+fw4gt+7n4+0ubRL3jtrrBNZbfdg@mail.gmail.com>
Subject: Re: [PATCH/RFT] arm64: dts: renesas: r8a77990: Add cpg reset for LVDS Interface
To:     Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kaneko-san,

On Fri, Jun 7, 2019 at 4:36 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> It is necessary to reset the LVDS Interface according to display on/off.
> Therefore, this patch adds CPG reset properties in DU device node
> for the R8A77990 SoC.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> ---
>
> This patch is based on the devel branch of Simon Horman's renesas tree.
>
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> index 83cf590..547e970 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> @@ -1766,6 +1766,8 @@
>                         clocks = <&cpg CPG_MOD 724>,
>                                  <&cpg CPG_MOD 723>;
>                         clock-names = "du.0", "du.1";
> +                       resets = <&cpg 724>, <&cpg 724>;
> +                       reset-names = "du.0", "du.1";

Same comment as for r8a77995.
https://lore.kernel.org/linux-renesas-soc/CAMuHMdV8Mg2ao9EwrLkiHF53Y_a5RKyvaqAv13uPvqTr19K++Q@mail.gmail.com/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
