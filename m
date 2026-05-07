Return-Path: <linux-renesas-soc+bounces-32248-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yL4eBc+Q/Gn3RQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32248-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 15:17:03 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 703BF4E9148
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 15:17:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C23BB30F8FE8
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 13:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C79F3A5E6F;
	Thu,  7 May 2026 13:06:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFBB15ECCC
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 May 2026 13:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159193; cv=none; b=Eal2isWF7zir9XSz152XKWHr7BBL2pPCt0jFqX/Zuzu6kA6dcQ6GIaqHncKXaDw/Gq85OTon65pQUZABGFr3J3sjrwmbRyCHjoR3bAd9GYnny+HafY+ABglbHJPZ1hfXrRCqNslkMZWKF3LETR0ixu8TV2Pl1/1/kck+ugiMdiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159193; c=relaxed/simple;
	bh=3KEsf8hW5vDrHWJD69ik4mJTX2qI1RyXuMnidIbzMQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MQ6l8ATBkW9HmRJMnUYTDaDhOqPStQBdOr2FDhO8GZxLRIkneZJWkeUZL8sHS31aJZEYSsy1xB0aWIMsswQ2A9dRwabkUz1YkyFsF+HWeuSojVRPEpbrgv8RLkVq4udAsyPxBIHsQxblXFEx98KxMCEpTsz3ctkr/Q+V1zVdB+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-57512a429d1so577939e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 06:06:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159190; x=1778763990;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/rfnlVV4hZ4Bnzpl4JtGBkoPv/yJhy21sNz8ykSgsE=;
        b=YlOqL1uPRVLUJcgMxT5Ib7dmtcMQX+rp8fiU7rb146vEGFgPVmtLO7wnWQMz1kB4nM
         dnNXwoiFiZ7ZVHCWTcNDFm7ny21MqpFnneeXjL00ku8TpDW5g+YjiZydu4Rr/n1EZohC
         Yy5joLHDUZHp0BBIveL2hgenUiKyiCVL9cADfPwcXYo35g2gZKIDY0Gnh+/QigZnfnES
         9XioKPM5G4TST27EeVCsq/hiwV5PtLPCVhehQgBABzt1cZplfHeDOhvI6xvECYFnzzUV
         MUe88tFspwwAr+FDkbmrxF07LmL+VeV38mcb7dHqoPqau3ABbE55rZmLLvKcN5dfIP0U
         69gw==
X-Forwarded-Encrypted: i=1; AFNElJ/7TXS4ZQpO7SHO/tNXMLOAAb4iXBMmdCH0tdfD+np37ZFjV0P4FI3OENY2szHa2PuS2Li0qPlv6NZCLMOvjKgFJg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8RNBCmiXV3L6vm+DQ+5jWj7fzxO6qBzWmEVaaVGoUvTyWR71P
	5a7lvcPwZGWkL+t9laPG2+dMQpojyjoY8nnPV0mAZhGNqr5lanPTdMxhEF1mXZOPXPY=
X-Gm-Gg: AeBDieurx4RdsUhvJM4jQfakAY/wNhoWHpRTJiNI8G4ltpOGHhJhEVBCBLT35ibe2/R
	HcebLjkK7Li9BHpSAcvU+boIkvof1nbWXhhxAwKL4YpLhkoOjzeJwebOVRKiexXBhNzQKqdzueB
	bZ/vHzyoT+nYLjF8cixApg8DWgBnZTg1onLBTCF9H2P7jVBp/dYLTf72/dX78X5G8QzsTdg8ua2
	owT3ub4dAm2SC0soTqBlb5uO8t4Mh6oHceZSL9kSDvy9wSZN/677tD8hJuEW0GVq0JT86IopKic
	el4SMSESSuVgd5s2teNEbmOOk2QHpfeu1Xvmr/E87qZ9zxxr9ERksg+ivAfTHqDy5NtbxxwqdSz
	oCjwUBOL+H8A/76+a6Vbn9T9OOUckWOOm/Cf5rczV99TxzV8D4zjJaJHXDl3QgQ8hEU/J49nk7W
	cqdcyufOn1XhM133yaE5WVigZl05oBbDO2nvnRVtA51YVqxL21TV5L1yKbJtLH+1q/xB6pSaOJu
	7SgMPNI4oEwQw==
X-Received: by 2002:a05:6122:da3:b0:56f:b0bd:2276 with SMTP id 71dfb90a1353d-575591f7b22mr4736703e0c.0.1778159190444;
        Thu, 07 May 2026 06:06:30 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-574a6dc1e08sm12029298e0c.13.2026.05.07.06.06.27
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 06:06:28 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56f70865797so437663e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 06:06:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8nFrrEH9pfYyuW9w4rKA+vbmVgKQqNf3aHjtSO7j0XHfGpkKWbe8/noSbmgwCBbQl21KFx0VKYEezJ+PtgwGvtpg==@vger.kernel.org
X-Received: by 2002:a05:6122:3293:b0:56b:1eb:d396 with SMTP id
 71dfb90a1353d-57559680c45mr4250734e0c.14.1778159187270; Thu, 07 May 2026
 06:06:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504144523.153906-1-biju.das.jz@bp.renesas.com> <20260504144523.153906-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260504144523.153906-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 15:06:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWESdLpNzMzCvQ0ZJM_hg9fgw1T+pn0MoeXx74YyXc7-w@mail.gmail.com>
X-Gm-Features: AVHnY4IDDt-ipBkq7SjbPkIcGhg1wXbnEJaQpBvmsG8maNMy-0mQZD-rRFQ8sbk
Message-ID: <CAMuHMdWESdLpNzMzCvQ0ZJM_hg9fgw1T+pn0MoeXx74YyXc7-w@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: renesas: rzg3s/rzg3l: Simplify PLL configuration macro
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 703BF4E9148
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32248-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.991];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

Hi Biju,

On Mon, 4 May 2026 at 16:45, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Replace the per-SoC G3S_PLL146_CONF() and G3L_PLL1467_CONF() macros with
> a unified CPG_PLL_CONF(stby, setting) macro defined in rzg2l-cpg.h.
>
> Drop the now-redundant GET_REG_SAMPLL_CLK1() and GET_REG_SAMPLL_SETTING()
> macros, replacing the latter with CPG_PLL1_SETTING_OFFSET() using
> FIELD_GET() to extract the offset value. Update RZG3L_PLL_MON_OFFSET() to
> use CPG_PLL_STBY_OFFSET() + 0xc directly.
>
> No functional changes.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a08g046-cpg.c
> +++ b/drivers/clk/renesas/r9a08g046-cpg.c
> @@ -56,9 +56,6 @@
>  #define G3L_SEL_ETH1_CLK_TX_I  SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 11, 1)
>  #define G3L_SEL_ETH1_CLK_RX_I  SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 12, 1)
>
> -/* PLL 1/4/6/7 configuration registers macro. */
> -#define G3L_PLL1467_CONF(clk1, clk2, setting)  ((clk1) << 22 | (clk2) << 12 | (setting))
> -
>  enum clk_ids {
>         /* Core Clock Outputs exported to DT */
>         LAST_DT_CORE_CLK = R9A08G046_USB_SCLK,

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -58,14 +58,15 @@
>  #define RZG3S_DIV_NF           GENMASK(12, 1)
>  #define RZG3S_SEL_PLL          BIT(0)
>
> +#define CPG_PLL1_SETTING_OFFSET(conf)  FIELD_GET(GENMASK(11, 0), (conf))
>  #define CPG_PLL_STBY_OFFSET(conf)      FIELD_GET(GENMASK(23, 12), (conf))
>  #define CPG_PLL_CLK1_OFFSET(x)         (CPG_PLL_STBY_OFFSET(x) + 0x4)
>  #define CPG_PLL_CLK2_OFFSET(x)         (CPG_PLL_STBY_OFFSET(x) + 0x8)
>
> -#define RZG3L_PLL_STBY_OFFSET(x)       (GET_REG_SAMPLL_CLK1(x) - 0x4)
> +#define RZG3L_PLL_STBY_OFFSET(x)       (CPG_PLL1_SETTING_OFFSET(x))

Shouldn't that be '(CPG_PLL_STBY_OFFSET(x))'?

>  #define RZG3L_PLL_STBY_RESETB          BIT(0)
>  #define RZG3L_PLL_STBY_RESETB_WEN      BIT(16)
> -#define RZG3L_PLL_MON_OFFSET(x)                (GET_REG_SAMPLL_CLK1(x) + 0x8)
> +#define RZG3L_PLL_MON_OFFSET(x)                (CPG_PLL_STBY_OFFSET(x) + 0xc)
>  #define RZG3L_PLL_MON_RESETB           BIT(0)
>  #define RZG3L_PLL_MON_LOCK             BIT(4)
>
> @@ -75,8 +76,6 @@
>  #define CLK_MRST_R(reg)                (0x180 + (reg))
>
>  #define GET_REG_OFFSET(val)            ((val >> 20) & 0xfff)
> -#define GET_REG_SAMPLL_CLK1(val)       ((val >> 22) & 0xfff)
> -#define GET_REG_SAMPLL_SETTING(val)    ((val) & 0xfff)
>
>  #define CPG_WEN_BIT            BIT(16)
>

> --- a/drivers/clk/renesas/rzg2l-cpg.h
> +++ b/drivers/clk/renesas/rzg2l-cpg.h
> @@ -59,6 +59,7 @@
>  #define CPG_CLKSTATUS_SELSDHI1_STS     BIT(29)
>
>  #define CPG_SAM_PLL_CONF(stby)         ((stby) << 12)
> +#define CPG_PLL_CONF(stby, setting)    ((stby) << 12 | (setting))
>
>  #define DDIV_PACK(offset, bitpos, size) \
>                 (((offset) << 20) | ((bitpos) << 12) | ((size) << 8))

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

