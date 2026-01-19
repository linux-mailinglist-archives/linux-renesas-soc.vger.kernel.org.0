Return-Path: <linux-renesas-soc+bounces-27071-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FB1D3B73E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 20:25:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E1F45300FA37
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 19:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A354023B604;
	Mon, 19 Jan 2026 19:25:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B146C296BD6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 19:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768850742; cv=none; b=qbU+ZgdFoir+ndAk/M4vWarDKA4qd/+aKNqBeK9W156diZEOCEbBxz0RLYMeSxKSiaiUZ3PypQdKc2O91DZCdjDXzbJQiOE9HjX3/sPCVwrfhGby2L9ugKvsP89JPaQrGlKfRnXPLWJKYWg9sN7V4EVtNPkTqp36Jjldb4wxxFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768850742; c=relaxed/simple;
	bh=6w5YfztAxp+kt70NlhcKY/Kkm11Las2qp371F9dYbyM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I7gD7GZiTlYQjcmfh+5ewDgFTbO+PSWhJWL8FF4Sg4caaRtOfM9WC3ROb7Y8SUVLopTjK9Reb3nOBLrRBPQ+EfbwqSBK5y/uq3uSb6VvqLu66A1ykHFsNzbSPXtbwqIAVcgZCd/W4X8JAusWfTDQp6u4U4xbVytlNS0CA1z3nWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5eea75115ceso4081132137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 11:25:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768850739; x=1769455539;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Y1wTxdZLJ7XhSQYYR0Ku2EXGP2C5XG02vKe6+mSL78=;
        b=aXrRgtPOmDBCOzJv9SGEVSEDxvhqfdKv3JsOZrVHX4PdCfPIEMWmbobVJPU34CnKJv
         +0OP8Cndm62gmF/pR7VmKH6jpUbNUpcmdRNvTRgSJQiQE0O85VQBk3MqLVZtz6S4B+Mv
         OcaUTTEG8zr/F8zKVJcNnpeS0t4J+5kcsLOF967doZYPHEP9/xy/14pn8uo80g/3uGCD
         FiTjNmb8+LoDFviIK4Yk9ClvBMh64TBCHR/mG7ve4vucwTc4CrrzZ4CdKcYL8j1rT1tX
         hiGy+LH1Yu9mZtMNfThPLOGPbr75L/pn78N55zR8MBkB8sSNR48/33d7ljTjp1y3yAu2
         Nqhw==
X-Forwarded-Encrypted: i=1; AJvYcCV5IYMBKrt+1muhAEvq8fIO5u2AZLV4BQa4fS80WFO+8q7QlxljnZWQMqJXJ0B45JHSxLN3wXPMfszMRFZLUO7zWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGYkp48bJGU3CUivLTelLCD1ROtQ3WzLDGtxSGyvebL1FSpLOF
	/0xB9ERQCla4sWYjRDZ3hTxgxYT1TfODLhW2aJ+TKaUKFTALlHIZRd1WhMkEi1Ri
X-Gm-Gg: AY/fxX7jqPjSL0H2u4gUbi+Vnl1Q1osGLMEs/J8gKnoRgEFv7Q3/wm5TMycBXwyLSPf
	sM+2c/gjl+BSq/GhBHfw4hqA/9pDIAG60DuAQBMsTtwRygbJurUizwxKeAL8b4HVtwnFe09ysIE
	R56zl+g5Om6DtdvUmhKImV/Pg97kFWTs5C0MnsSf+9y3C3d3+TFDMJ12OtVtEiNBic2euEUuGUJ
	479m9ZKWQfUfLd3a/g1Yub2uDzawP0i6luDOrdhv+Emo5FCBDscFVh4jvH01QYsZxc2shAfGsce
	6cp7Xwy+5bNOJ7prNUq7rR1IkAk92dS21ENiFOT8QI2e+ND0PcIR7Ue2qnp9hoZTrBxqQ07mUiK
	WBiy2r/ARlfdEKEPm7ssQgzpFbOUka1nNM5dVzZPu8ciiUv9EkW9YkP8Q8COZu4WPSrEXPXLxuh
	O63D6IndXQJO1qO4klYvW7JGcFnE1HQYLe7o4890nnDFIwtabH
X-Received: by 2002:a05:6102:dd3:b0:5d6:a6c:2458 with SMTP id ada2fe7eead31-5f1a53d4c73mr3428816137.9.1768850739431;
        Mon, 19 Jan 2026 11:25:39 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f1a6900c1esm3626919137.3.2026.01.19.11.25.38
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 11:25:38 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-947fef8ebf4so185343241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 11:25:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUGaMCn7Ab4llA9jKxkvgeo2P8N6rawZzhYt0f2W+LzXimgQDcVUeOlH+X5jAILZ/o5Vql0KQUqpR7EBbCV2D3Gyw==@vger.kernel.org
X-Received: by 2002:a05:6102:3e96:b0:5ef:b32c:dff8 with SMTP id
 ada2fe7eead31-5f1923fb2c1mr5826988137.5.1768850738083; Mon, 19 Jan 2026
 11:25:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com> <20260119-soc-of-root-v1-7-32a0fa9a78b4@oss.qualcomm.com>
In-Reply-To: <20260119-soc-of-root-v1-7-32a0fa9a78b4@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Jan 2026 20:25:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU56p9jH8OZ5bpwKq8Q31C-8X85YAjiXZm8amYdo+Xotw@mail.gmail.com>
X-Gm-Features: AZwV_QjRSaQ_qXyXNZN9OqtIjEIE6rAZwNcvdO7jDgxqMH0vtYkLnv2_hmzs9Y4
Message-ID: <CAMuHMdU56p9jH8OZ5bpwKq8Q31C-8X85YAjiXZm8amYdo+Xotw@mail.gmail.com>
Subject: Re: [PATCH 7/8] soc: renesas: don't access of_root directly
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

On Mon, 19 Jan 2026 at 11:40, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> Don't access of_root directly as it reduces the build test coverage for
> this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
> to retrieve the relevant information.
>
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Thanks for your patch!

> --- a/drivers/soc/renesas/renesas-soc.c
> +++ b/drivers/soc/renesas/renesas-soc.c
> @@ -6,6 +6,7 @@
>   */
>
>  #include <linux/bitfield.h>
> +#include <linux/cleanup.h>
>  #include <linux/io.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> @@ -468,7 +469,11 @@ static int __init renesas_soc_init(void)
>         const char *soc_id;
>         int ret;
>
> -       match = of_match_node(renesas_socs, of_root);
> +       struct device_node *root __free(device_node) = of_find_node_by_path("/");
> +       if (!root)
> +               return -ENOENT;
> +
> +       match = of_match_node(renesas_socs, root);

I am not so fond of these of_find_node_by_path("/") + something replacements.
What about adding an of_match_root() helper?

However, in the previous patch you used a different strategy:

-       if (!of_match_node(imx8_soc_match, of_root))
+       if (!of_machine_device_match(imx8_soc_match))

>         if (!match)
>                 return -ENODEV;
>
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

