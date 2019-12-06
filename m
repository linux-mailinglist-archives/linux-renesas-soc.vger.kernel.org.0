Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE78D11573B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2019 19:40:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726321AbfLFSki (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Dec 2019 13:40:38 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:45269 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726315AbfLFSki (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Dec 2019 13:40:38 -0500
Received: by mail-lf1-f68.google.com with SMTP id 203so5964470lfa.12
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Dec 2019 10:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UwMCmr796apltCBLUqhe/A5aREgROqeA/aKGMVOBK5A=;
        b=ja4FwW0ldHzkgz7cFjZiTR4WwZTx291RUps/Y5tPmXtLWqqXGR/Mt2Sz/eofDjGBYh
         7RrVqrQ2AQ1PxwrDbhSRFwipbclA3C0ftzK80mIPhUETBx64M6HUSGiW3Y0mIYPAvTki
         Aq3q6ZLigqXlHZ8lbMwKhmNDmzuGYUpDNCPHfputU6+rkN4gs6iih+lvf09Y1Fcdrg47
         eZLY1u/DUKVzH58EtI+eRdkMrdLNC0Un7QM69yRcXwDCtYMahx1tLehjRwcCS9iGEJiN
         Jr6MzYRQ5Q8ytqVsVHVR0p0G/O1HXerBiL7uMqN6V8HWQ7GS7qSg90EwJHg/I/QLOnzU
         5QgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=UwMCmr796apltCBLUqhe/A5aREgROqeA/aKGMVOBK5A=;
        b=lLgY8voRTi3ulYDSHYiwBLe7AjAK5UuPv6vVEVBb0SKrU8Eej82BMOTGuSsntA+RwT
         JO5NAf/KW28byVUfjDSAv8H1xdVNYT52s+azf6xMPCkQ6cytha/NXO3JWq/bin70Ox+R
         XRtvx/WSrhSP8V5tR6/pWavFF3MuFIVxGf4q4lDbCIQPb/eqO+QqBGwKli02jIpFVp2s
         94MBxjDpvCkGq/ySgapE7RdwpuoIxAgqODs77Owc6mb0z4ve+7S7+egcx8T392icTlFJ
         Ovp+5UoBEt0dd6bkbu8HsZxIH/Iky4bzGXOO0k1fZTft9w1R7GE2MXEjAJtSzt+g6kNM
         pY0w==
X-Gm-Message-State: APjAAAW525YY+Er02giFH9g67offChjn8jKBh7xJLiQKO1nIf4irza0i
        47PyATIKX4fFGeDTL+16Oybx/dbHE9g=
X-Google-Smtp-Source: APXvYqwoiF1L7BhBtSP9Wb2lbIR6oGXDekXGfEbkT9v9ygQo6K88wZj1r41+5B0NKf9UvMHc0EJ3VA==
X-Received: by 2002:ac2:430e:: with SMTP id l14mr5508779lfh.79.1575657636192;
        Fri, 06 Dec 2019 10:40:36 -0800 (PST)
Received: from wasted.cogentembedded.com ([2a00:1fa0:4291:257c:a228:1c89:88a1:5b3b])
        by smtp.gmail.com with ESMTPSA id l28sm6929760lfk.21.2019.12.06.10.40.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Dec 2019 10:40:35 -0800 (PST)
Subject: Re: [PATCH v2 3/6] clk: renesas: r7s9210: Add SPIBSC clock
To:     Chris Brandt <chris.brandt@renesas.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Mason Yang <masonccyang@mxic.com.tw>
References: <20191206134202.18784-1-chris.brandt@renesas.com>
 <20191206134202.18784-4-chris.brandt@renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <5644c687-7692-53f2-f01e-0e7bf62464ea@cogentembedded.com>
Date:   Fri, 6 Dec 2019 21:40:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20191206134202.18784-4-chris.brandt@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 12/06/2019 04:41 PM, Chris Brandt wrote:

> The SPIBSC clocks are marked as critical because for XIP systems, the
> kernel will be running from QSPI flash and cannot be turned off.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
> v2:
>  * Removed spibsc from critical clock section

   So you've removed it from the critical table but left the patch description
intact?

[...]

MBR, Sergei
