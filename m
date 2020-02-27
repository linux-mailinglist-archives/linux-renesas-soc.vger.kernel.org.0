Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 548BA17262F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Feb 2020 19:12:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729385AbgB0SKd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Feb 2020 13:10:33 -0500
Received: from mail-lj1-f169.google.com ([209.85.208.169]:45629 "EHLO
        mail-lj1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729281AbgB0SKd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Feb 2020 13:10:33 -0500
Received: by mail-lj1-f169.google.com with SMTP id e18so215208ljn.12
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Feb 2020 10:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lZwQ7m18i9+lKvREczPcF+oIj2CXwsJ7mJqMPCtyg+8=;
        b=eYm4GQi1sw2Ds59Hm1KrOZaaocITpeplWcCEjWWqSSmQWRwljouNr9jYietApt6jFJ
         s/peyVM6akFkoUB0rUvyxHSdltC+Bx0dQW2KHu95+Nt5gbfm913X63dZSEnDICncK372
         1sx9ST/g5uT6IJO+H60IBGQ5SjS7QARQW+llI+bdOGfTu4J6IFYSdz3nS0ztcI8oE2D0
         5DSuJ4JzlWbjKxyDU0Xfl14sJ1CpIACm20vVMK3E7FExhE1l2sm3EOkz7D6eIPywjtI9
         oEccAjWpL5W7t6AlsFvi8HV4dDCFVONMK639e4rQD3cqspx9hvQd+CFQd/fbMTZH+hW7
         p44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lZwQ7m18i9+lKvREczPcF+oIj2CXwsJ7mJqMPCtyg+8=;
        b=tVbZPl6Km1R3khsz9urSU6ZxCQC++qGYzcNnshKYet+bvvTx/CKgewoR1wiDZ+3UdJ
         fT77k8V3cjsMj1Ow57eWGxqE5X9v9yH5mgW/WKgXthUHPjmGUcTaxYUguOBoW64oXW+i
         YQFdWugWRhrCjgSSfq17MNMPg7jbYlRo85TPA3F3ldPp+zmnAI0Z49+rT+r/6OX36INX
         Dlp/w6zKxXsReHKTWtJQoh9+RkW36I/BFvD6SCqAXnQuLCff2BuxQAnvrBhj/6/jLntq
         6XSkmodJM5HtTdjOerLgtSUHhWJXbiMNOc2mgdsiIrZq9+dphSSE1fat5RqaC0rvMBzQ
         J0ZQ==
X-Gm-Message-State: ANhLgQ0gWXXTFwiVOZSFVYx5esnoyHeCWwDyfoHMFuk/HmSfhepKjaqD
        fE7y2NQvGjQLhqZZBad7Xgcqnw==
X-Google-Smtp-Source: ADFU+vt6//Zzlu4oIzRFI47jGSAzXqPCEc0rs/y3npdFA3WXIV5yOd+1XjT343aFZ2ptTZjvunRvnw==
X-Received: by 2002:a2e:9dc3:: with SMTP id x3mr169644ljj.257.1582827030464;
        Thu, 27 Feb 2020 10:10:30 -0800 (PST)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id z17sm3720518ljm.19.2020.02.27.10.10.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2020 10:10:29 -0800 (PST)
Date:   Thu, 27 Feb 2020 10:10:18 -0800
From:   Olof Johansson <olof@lixom.net>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [GIT PULL 0/5] Renesas SoC updates for v5.7
Message-ID: <20200227181018.5nixs7o7lght3mug@localhost>
References: <20200226110221.19288-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200226110221.19288-1-geert+renesas@glider.be>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Feb 26, 2020 at 12:02:16PM +0100, Geert Uytterhoeven wrote:
> 	Hi arm-soc folks,
> 
> This is my first pull request for the inclusion of Renesas SoC updates
> for v5.7.
> 
> It consists of 5 parts:

Hi,

Only 2 of these were sent to arm@kernel.org / soc@kernel.org: 2/5 and 5/5.
Mind checking your scripts to make sure you send them to us so they end
up in our patchwork? (And please resend the ones who weren't).


Thanks!

-Olof

