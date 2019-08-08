Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E337785F11
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Aug 2019 11:55:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731586AbfHHJzz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 8 Aug 2019 05:55:55 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38448 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731550AbfHHJzz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Aug 2019 05:55:55 -0400
Received: by mail-lj1-f193.google.com with SMTP id r9so88287639ljg.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Aug 2019 02:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oDN0rGjGfc55O/5uQ01ERUI7cndh16/GKyAUPFzsNBE=;
        b=QbDLnC9h4d3ToHUAty+Zr9ImspSeY5IL36mAYD2g3oT/4MVJsDpXoeLDZyn9jsCDyw
         OVF57q28R8kjecdfpvJnmSyFGgOey56sPAcz8kuuWrxgOVMFzfnKhtHzbnxm7QvRrr/z
         eQIJNQpIDhWPKdc/qOtERa6aeBnSWyHYilw6tIK+Fm4Y1DbwD3tHogXjhbN2Zwyv67kK
         joOyBPyUEdF14C36Uq8/V0/y5WpuxY61qQf+pWRC+8sihMlEmWT4PGTTXIY3F+XTLCso
         AW/04Mu/aOFMsE34NRKd8OAKCt5QC9py3BVrKHvHQYRCmcd1WvIbTySkbj/RD/GcueqD
         GQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oDN0rGjGfc55O/5uQ01ERUI7cndh16/GKyAUPFzsNBE=;
        b=SbkCmA4LdFsYdWr0JZnjUCaO/mWwI2nkXOCJsOxbA3dkbs7Tn0S5WX07ap9p3gatBz
         1XMI2353uKuqRAc+IMdlAfnXQ1s5nvnmFVrZh6T//oucourFOeDQW+GardMFVPiM2ZtK
         2D3sPDqA9PyZ+YS3zQTrxD0fhB7E+a3d+2H7HuFfauoCcRdcWnPkb/xKvz6wqjjWH5QC
         lDhvrNtOXWHp7VDzFy2FGLrCzs82she2UPmSdJ3xJo1sHBiAd7UYJ1HntcOeENudDobn
         Tg6b5KGFNUzx28S9RYT9C0Zy+Ox5TmMvdVUZS7mMZ/ocaEAOhqsJtupOyJ+diPXQUnON
         36mA==
X-Gm-Message-State: APjAAAWAizz7SZuZH/wPrAyAuA0yDGJsCxSsx7X1+/Pfk6FkyD9tLFnb
        ufwLmsJpoGU+GtzedZS+XDejY1mIC5M=
X-Google-Smtp-Source: APXvYqx8a18LmOP1nJo/tE60vMtHdZ6dS1T/SaZhLRJiJwecapVQuDKcX9h7L6697ygui55hZPLrWA==
X-Received: by 2002:a2e:96d5:: with SMTP id d21mr7759677ljj.170.1565258153172;
        Thu, 08 Aug 2019 02:55:53 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:8c7:ada9:25b2:24d8:3973:eb87? ([2a00:1fa0:8c7:ada9:25b2:24d8:3973:eb87])
        by smtp.gmail.com with ESMTPSA id t137sm16789638lff.78.2019.08.08.02.55.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Aug 2019 02:55:52 -0700 (PDT)
Subject: Re: [PATCH v2] pwm: rcar: remove a redundant condition in
 rcar_pwm_apply()
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        thierry.reding@gmail.com
Cc:     linux-pwm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <1565246333-2185-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <b528827c-1744-901e-b795-ddd1aaf828d3@cogentembedded.com>
Date:   Thu, 8 Aug 2019 12:55:40 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565246333-2185-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 08.08.2019 9:38, Yoshihiro Shimoda wrote:

> Since the rcar_pwm_apply() has already check whehter state->enabled

    Checked?

> is not set or not, this patch removes a redundant condition.

    Is set or not?

> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
[...]

MBR, Sergei
