Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBEAE2C2FC2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Nov 2020 19:11:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404168AbgKXSLL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Nov 2020 13:11:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404106AbgKXSLL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Nov 2020 13:11:11 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A538C0613D6;
        Tue, 24 Nov 2020 10:11:11 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id d20so14287422lfe.11;
        Tue, 24 Nov 2020 10:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GMTk9IPtCbGbtCQyv0EbWnn+I/Sjehwg2jsohofHzyU=;
        b=OuxEl7gcKqpSycWYVeoIHCdSCnT9MUbGiUTCdoiA15DPvS4+IFUKsxCFotAbxnYA8b
         OxpR3J4DqTHeklh7UxLJKLfZiGqmrI39FFam9AGvdDcjg3tSeYcvqx+eS0EWfSKOmcuj
         vNDfNuGFN4QbrfSHpwWeFVAPp1VqxdPwSXeh6WnoQkMyqgyTmXUcxlrw7z0M4jNnK/kG
         9Jm1Tt6pHFgvHlrpHQ962xnFzm55cCKe1HGb1cs0D4BnFLkUWQ/t6N2iynzesktkQQqx
         pn/qtPmJMJGNyOXvngK7aUWCXeuz7Q5IqB2YFDjKjmCbDQ1ew1biJVhaaJqjlZGetYmB
         x1CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GMTk9IPtCbGbtCQyv0EbWnn+I/Sjehwg2jsohofHzyU=;
        b=JKsm6Zor0Eb6AW71Er6YDo98gGI62NucUK2BCY14VxYhzy1BWPFfiQ7OKR6xUi7clZ
         JbfIMixCne1ymChYNkZFt9NRxIwkwMuyJVr+3opbml6ov3NE+RfFDA1vFetCE1zMI0TK
         jvN7grbAo/hUUidlm7OgwSwKSErfe9XLxHalMlnKnF9G9GhUyeIsRzrBkBqy9C8C4d6S
         2NAQRfv6ABCPkZKd+xCgw4SwJAWN0LaoOqg3NY3Zg2G0k7/HQA9PGDk+4dkc//CizIVw
         8B44PM73F6CWujwQ44Ql3Yvw57wuMxP8CG+rO/lTUomcJMzPMIhZqjHJGRsAwCVKt3gT
         tWPw==
X-Gm-Message-State: AOAM531JbIeFx1cmWtLZw57bvCmGUIUXnTRimgaIN/2KLojaDigIWSFb
        NAjq+fEVHPM3ngN6VW+Kjx7WWiZs9vlJuA==
X-Google-Smtp-Source: ABdhPJwGVQNUfCQ7hEW5Zm+tTZ5mu9/gDWYE4o8op7oYuHr8vq8kO7d/abeOd2xvXy0GHBMmkLG+Ng==
X-Received: by 2002:a05:6512:6d0:: with SMTP id u16mr1810672lff.497.1606241469651;
        Tue, 24 Nov 2020 10:11:09 -0800 (PST)
Received: from ?IPv6:2a00:1fa0:651:eeec:8461:5bd1:fea0:1c50? ([2a00:1fa0:651:eeec:8461:5bd1:fea0:1c50])
        by smtp.gmail.com with ESMTPSA id 6sm407998ljr.127.2020.11.24.10.11.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 10:11:09 -0800 (PST)
Subject: Re: [PATCH 2/5] memory: renesas-rpc-if: Make
 rpcif_enable/disable_rpm() as static inline
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jiri Kosina <trivial@kernel.org>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
References: <20201124112552.26377-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20201124112552.26377-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <d7e512d5-e56f-db04-182c-e907b2cfbb71@gmail.com>
Date:   Tue, 24 Nov 2020 21:11:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201124112552.26377-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 11/24/20 2:25 PM, Lad Prabhakar wrote:

> Define rpcif_enable_rpm() and rpcif_disable_rpm() as static

   Not sure why I didn't do it this way myself...

> inline in the header instead of exporting it.

   s/it/them/.

> Suggested-by: Pavel Machek <pavel@denx.de>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/memory/renesas-rpc-if.c | 13 -------------
>  include/memory/renesas-rpc-if.h | 13 +++++++++++--
>  2 files changed, 11 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
> index 69f2e2b4cd50..c5b5691503d7 100644
> --- a/drivers/memory/renesas-rpc-if.c
> +++ b/drivers/memory/renesas-rpc-if.c
[...]
> @@ -204,18 +203,6 @@ int rpcif_sw_init(struct rpcif *rpc, struct device *dev)
>  }
>  EXPORT_SYMBOL(rpcif_sw_init);
>  
> -void rpcif_enable_rpm(struct rpcif *rpc)
> -{
> -	pm_runtime_enable(rpc->dev);
> -}
> -EXPORT_SYMBOL(rpcif_enable_rpm);
> -
> -void rpcif_disable_rpm(struct rpcif *rpc)
> -{
> -	pm_runtime_put_sync(rpc->dev);

   Ugh... sorry for this blunder (that went unnoticed till now). Mind fixing
it to pm_runtime_disable() (before this patch)?

> -}
> -EXPORT_SYMBOL(rpcif_disable_rpm);
> -
>  void rpcif_hw_init(struct rpcif *rpc, bool hyperflash)
>  {
>  	u32 dummy;
[...]

MBR, Sergei
