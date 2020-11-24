Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 803E72C319F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Nov 2020 21:04:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730056AbgKXUEJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Nov 2020 15:04:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727189AbgKXUEJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Nov 2020 15:04:09 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05882C0613D6;
        Tue, 24 Nov 2020 12:04:09 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id d17so30616200lfq.10;
        Tue, 24 Nov 2020 12:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yQgYdytsJTWx40vs8O0euMQoqQTcCtKDhAMPimfddKI=;
        b=cosKrxFY6w+hivTa43r0ylY+uV+RFy+HNc+RCmbsbCdxt7tppl30ly3THnjosC7Xxd
         OItFN1kWC5JZe1g3DJhuLCNZnvJdMLJ23sNp6M5GRo2+FWLp7i0GhYYt/KYbDxUeHy7f
         2lkCFsvAqUu5ICKeVt0xr0qNgZI6UUBzcGEXC2MBuGpDnzPkgNyU8jl2QQ/4f4ubg57h
         vdnuE1FaCYTNpHAohUYfIWBKqzHbERV2b1GbZrfjN2x2Lbbj1JG3IghFWJXBAdSvHxPE
         pjzvBz6NvjCy5d9OLv0WD/UaSAd1lcXudLuUtXErMMP8HGubThVonaSy4Inc14JMHFHQ
         Zirw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yQgYdytsJTWx40vs8O0euMQoqQTcCtKDhAMPimfddKI=;
        b=iQbDt+gu4Wd/OIIbdKJZSeWp/xrmVzbKide7/zjL0aHuTBGq6JSHetRIBkEJegzrGG
         RtJChCzH+x/cdvTXyhc5CDrBeweCU7UsXcibLyxvUxb0UPsx/RT+jcktOQiBF/mbor31
         KcHVKqrlSnbxfqp+fL+6TSBtTlTxN3AMh0jUmi5VNflrfTAGzNOii1vEefjEsRwHrP3p
         rSA457b8uhDBFqeHn0/SrsXmTlW5NIsHHmqere9O4Jad+reKWjJZS9QVUaLtQq91gutv
         VCVhsXFti/e24CpZjnNlicOiRMOgsgGu6FIHT0eAt8MnYLzSazE++yhdgkNNn8uP5dEg
         +/+Q==
X-Gm-Message-State: AOAM532P47wo0NjfpCENW+MoHY5MUs/jX7pmAvX2NRw61mWHRnaK2np2
        woCur6rnE7TUOp/uhSoQeLo=
X-Google-Smtp-Source: ABdhPJwG7Ww3zbg4TMYvm6069UG3PkJtckTYIUaBtZFqTTdokEnajSpUitxGVVTZ9tOZILUi0mcbvA==
X-Received: by 2002:a19:42cd:: with SMTP id p196mr2200173lfa.228.1606248247530;
        Tue, 24 Nov 2020 12:04:07 -0800 (PST)
Received: from ?IPv6:2a00:1fa0:651:eeec:8461:5bd1:fea0:1c50? ([2a00:1fa0:651:eeec:8461:5bd1:fea0:1c50])
        by smtp.gmail.com with ESMTPSA id y132sm1267lfc.8.2020.11.24.12.04.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 12:04:06 -0800 (PST)
Subject: Re: [PATCH 4/5] memory: renesas-rpc-if: Avoid use of C++ style
 comments
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
 <20201124112552.26377-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <8ddf57ec-c1af-cc20-ecba-c8cd96e56d7a@gmail.com>
Date:   Tue, 24 Nov 2020 23:04:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201124112552.26377-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 11/24/20 2:25 PM, Lad Prabhakar wrote:

> Replace C++ style comment with C style.

   Thanks, I've overlooked this, and the header files should use C style comment,
not C++.
 
> While at it also replace the tab with a space between struct and
> struct name.

   No connection between these 2 changes, so there should be 2 patches, not 1.
Also, I'd like to ask you that they're left intact (unless it causes problems
for you).

> Suggested-by: Pavel Machek <pavel@denx.de>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
[...]

> diff --git a/include/memory/renesas-rpc-if.h b/include/memory/renesas-rpc-if.h
> index b8c7cc63065f..30ea6bd969b4 100644
> --- a/include/memory/renesas-rpc-if.h
> +++ b/include/memory/renesas-rpc-if.h
> @@ -19,7 +19,7 @@ enum rpcif_data_dir {
>  	RPCIF_DATA_OUT,
>  };
>  
> -struct	rpcif_op {
> +struct rpcif_op {
>  	struct {
>  		u8 buswidth;
>  		u8 opcode;
> @@ -57,7 +57,7 @@ struct	rpcif_op {
>  	} data;
>  };
>  
> -struct	rpcif {
> +struct rpcif {
>  	struct device *dev;
>  	void __iomem *dirmap;
>  	struct regmap *regmap;
> @@ -93,4 +93,4 @@ static inline void rpcif_disable_rpm(struct rpcif *rpc)
>  	pm_runtime_put_sync(rpc->dev);
>  }
>  
> -#endif // __RENESAS_RPC_IF_H
> +#endif /* __RENESAS_RPC_IF_H */

MBR, Sergei
