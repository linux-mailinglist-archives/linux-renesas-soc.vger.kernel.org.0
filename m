Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77C9D3E3B2A
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  8 Aug 2021 17:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232134AbhHHPqy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 8 Aug 2021 11:46:54 -0400
Received: from esgaroth.petrovitsch.at ([78.47.184.11]:54950 "EHLO
        esgaroth.petrovitsch.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229923AbhHHPqx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 8 Aug 2021 11:46:53 -0400
X-Greylist: delayed 617 seconds by postgrey-1.27 at vger.kernel.org; Sun, 08 Aug 2021 11:46:52 EDT
Received: from thorin.petrovitsch.priv.at (84-115-219-158.cable.dynamic.surfer.at [84.115.219.158])
        (authenticated bits=0)
        by esgaroth.petrovitsch.at (8.16.1/8.16.1) with ESMTPSA id 178Fa0Qk284153
        (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT);
        Sun, 8 Aug 2021 17:36:01 +0200
DKIM-Filter: OpenDKIM Filter v2.11.0 esgaroth.petrovitsch.at 178Fa0Qk284153
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=petrovitsch.priv.at;
        s=default; t=1628436962;
        bh=ldKn0U8KvfBvOVhOmCB8P8LDLYD3v1sH4Y5QxM2Or08=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=jlp8OYhCcgpbUgtRgz/L7FIczgPQ+g4OgnEh7AhtKPiWSF8VoqdjJFGNmnypEW7i/
         uVeji1HYskG3nbB0DTBTROFDGzvNvA4IugFL/e66UPrmgnTrYGJb2fQ09zX5NLLPrB
         xQsA8R/8ExCfmCPDFzdGvWfSgsPTdIcrUBvfzx+U=
X-Info-sendmail: I was here
Subject: Re: [PATCH v4 2/3] drivers/soc/renesas: Prefer memcpy over strcpy
To:     Len Baker <len.baker@gmx.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Santosh Shilimkar <ssantosh@kernel.org>
Cc:     Kees Cook <keescook@chromium.org>,
        David Laight <David.Laight@ACULAB.COM>,
        Robin Murphy <robin.murphy@arm.com>,
        linux-hardening@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20210808125012.4715-1-len.baker@gmx.com>
 <20210808125012.4715-3-len.baker@gmx.com>
From:   Bernd Petrovitsch <bernd@petrovitsch.priv.at>
Bimi-Selector: v=BIMI1; s=default
Message-ID: <39485c0e-511c-50a0-83be-f9ce6fc47e67@petrovitsch.priv.at>
Date:   Sun, 8 Aug 2021 17:35:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210808125012.4715-3-len.baker@gmx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-DCC-wuwien-Metrics: esgaroth.petrovitsch.priv.at 1290; Body=14 Fuz1=14
        Fuz2=14
X-Spam-Status: No, score=-1.2 required=5.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.0 NICE_REPLY_A Looks like a legit reply (A)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        esgaroth.petrovitsch.priv.at
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi all!

On 08/08/2021 14:50, Len Baker wrote:
> strcpy() performs no bounds checking on the destination buffer. This
> could result in linear overflows beyond the end of the buffer, leading
> to all kinds of misbehaviors. So, use memcpy() as a safe replacement.
> 
> This is a previous step in the path to remove the strcpy() function
> entirely from the kernel.
> 
> Signed-off-by: Len Baker <len.baker@gmx.com>
> ---
>  drivers/soc/renesas/r8a779a0-sysc.c | 6 ++++--
>  drivers/soc/renesas/rcar-sysc.c     | 6 ++++--
>  2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/renesas/r8a779a0-sysc.c b/drivers/soc/renesas/r8a779a0-sysc.c
> index d464ffa1be33..7410b9fa9846 100644
> --- a/drivers/soc/renesas/r8a779a0-sysc.c
> +++ b/drivers/soc/renesas/r8a779a0-sysc.c
> @@ -404,19 +404,21 @@ static int __init r8a779a0_sysc_pd_init(void)
>  	for (i = 0; i < info->num_areas; i++) {
>  		const struct r8a779a0_sysc_area *area = &info->areas[i];
>  		struct r8a779a0_sysc_pd *pd;
> +		size_t n;
> 
>  		if (!area->name) {
>  			/* Skip NULLified area */
>  			continue;
>  		}
> 
> -		pd = kzalloc(sizeof(*pd) + strlen(area->name) + 1, GFP_KERNEL)> +		n = strlen(area->name) + 1;
> +		pd = kzalloc(sizeof(*pd) + n, GFP_KERNEL);
Zeroing the allocated bytes is not needed since it's completly
overwritten with the strcpy()/memcpy().
>  		if (!pd) {
>  			error = -ENOMEM;
>  			goto out_put;
>  		}
> 
> -		strcpy(pd->name, area->name);
> +		memcpy(pd->name, area->name, n);
>  		pd->genpd.name = pd->name;
>  		pd->pdr = area->pdr;
>  		pd->flags = area->flags;

And similar for the second hunk.

MfG,
	Bernd
-- 
Bernd Petrovitsch                  Email : bernd@petrovitsch.priv.at
     There is NO CLOUD, just other people's computers. - FSFE
                     LUGA : http://www.luga.at
