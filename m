Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D3C24CEC7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2019 15:33:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbfFTNda (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 20 Jun 2019 09:33:30 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38381 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726551AbfFTNda (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Jun 2019 09:33:30 -0400
Received: by mail-wm1-f66.google.com with SMTP id s15so3194736wmj.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Jun 2019 06:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=UyTNtWpDNUqvJ/ppvGInqhoa6vYa4E6l+E2baxrdXy8=;
        b=zoeaQRzxMTnEsN1CMz93f3fqjxv3BPQwSmryQDg6AF4bjNcfOdxQ4MH65mSp3d56GJ
         /Y5TCWse36drltnNr34R1USJsoj2A+YM9olbKeMbwwbZAhWmQWyzd1WIqlsfvAMWxLHn
         3Z6WEKa/qWBgajlah0TiHtGrs0E15VrLRo2F9Vut5sYjf+SBeEG9Ttqms0cWLT0Mx0Mr
         E333Pwjagl4ZarHbj/d13uJnLla9y76SLuInhbE5KCd8mEyUg4EzRz+5X/a9OEFAdQQK
         86UQuOsvhjc/ZpytjSgvp+1Z6lb29uK+VNtXQOeNxoDz3/6ebYqspqBWzTaaII4hUywg
         ZUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=UyTNtWpDNUqvJ/ppvGInqhoa6vYa4E6l+E2baxrdXy8=;
        b=diM6TTGXmfY8Wyu2ESHL3FAJnu01068mdqMQcWQUcCcoB2+4rqjKdg4lUJzFO4zhkq
         76fDTt7JBvTGc6ztBrjSvD4sZAsShhVY3FtfHQF3zzPXBZ6Iwi8gRYGwOl++b3chFJxt
         GgWu8BKnQXX38c8s9NSdIASXSJ7793yGEviQ30Z7eckSwKhWeEyh/2TgvToAxmOUstpa
         qiYhaAOZyAGatX5yqgC0IpuX2+evlekKo3wjj50emhtABLNJjyRRcPlJJC8WT8JLMNR4
         1+YVIbGzgqolw6zUToPRdRAG932pG9Qj+BLnw+4vP9BV5EyBMET48RreZjLN62sIz0Rz
         nK6A==
X-Gm-Message-State: APjAAAWK5c5E+tIx7+SgAhCq8jy6ROC4k1AhNkEzZr6Z6Fl7BfDmKsnI
        faYj8UIwXWFXUZlrjn3ZDqSTTw==
X-Google-Smtp-Source: APXvYqzROfZJH3htXO9n+sl9JMc1akUlTiWwlf9l9OGYSNyTr5XoUkMHidrtY0p6mN0Jwnki8v877w==
X-Received: by 2002:a1c:2d8b:: with SMTP id t133mr2934045wmt.57.1561037607997;
        Thu, 20 Jun 2019 06:33:27 -0700 (PDT)
Received: from dell ([2.27.35.243])
        by smtp.gmail.com with ESMTPSA id 35sm5582192wrj.87.2019.06.20.06.33.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jun 2019 06:33:27 -0700 (PDT)
Date:   Thu, 20 Jun 2019 14:33:26 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Steve Twiss <stwiss.opensource@diasemi.com>
Cc:     "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "kieran.bingham+renesas@ideasonboard.com" 
        <kieran.bingham+renesas@ideasonboard.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "peda@axentia.se" <peda@axentia.se>,
        Support Opensource <Support.Opensource@diasemi.com>
Subject: Re: [PATCH] mfd: da9063: occupy second I2C address, too
Message-ID: <20190620133326.GE4699@dell>
References: <AM6PR10MB218184C8F2206024C6CB77EAFEE40@AM6PR10MB2181.EURPRD10.PROD.OUTLOOK.COM>
 <20190620122853.GD4699@dell>
 <AM6PR10MB2181D2A08D98FB9F8092EC8DFEE40@AM6PR10MB2181.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AM6PR10MB2181D2A08D98FB9F8092EC8DFEE40@AM6PR10MB2181.EURPRD10.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 20 Jun 2019, Steve Twiss wrote:

> On 20 June 2019 13:29, Lee Jones wrote:
> 
> > Subject: Re: [PATCH] mfd: da9063: occupy second I2C address, too
> > 
> > Why isn't this reply attached (threaded) to the patch.
> 
> My apologies. It wasn't my intention to split Wolfram's original e-mail thread.
> 
> I don't usually reply using the mailto: link from lore when creating e-mails.
> Outlook mustn't support the In-Reply-To header.
> 
> I'll figure out a different way to reply in future.
> 
> > Is your mailer broken?
> 
> It's Windows

Say no more. ;)

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
