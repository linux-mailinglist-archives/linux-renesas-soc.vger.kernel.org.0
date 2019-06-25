Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C58654E46
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2019 14:05:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727289AbfFYMFB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jun 2019 08:05:01 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45908 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726557AbfFYMFA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jun 2019 08:05:00 -0400
Received: by mail-lj1-f194.google.com with SMTP id m23so15945518lje.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jun 2019 05:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nY+BqXk1DYP4ITKpAYz7cAkQx4t8hhoZE7RF+CM52r0=;
        b=zOmu3vsCxLVqISYOnmVYZhCs7CT53fctmhP8BlWKY+2gfwLTAcVkIFh7RgY7AgJOBU
         dbp7yEEk8IInO3AADrw7CJ/r+h85zuCWkraMFy3Xvak4UNlTdmcMfJG+9bZIRN19K3GD
         I43N/FNmLEFQjhyruUVuBSc6mxT8OxRk4QIp49IheuJ4xizgac3a/E5dGh0LdbEhixkn
         kEOXv81gUEirOHvyqIc/5g9Jo4Q/T0EqPSsERz28ZfrLyGiWrHTLhQ0AvnISTdSzadU6
         o/hBoVJv14VtEzb6W1SqnIcS5TIqnYUKwjm0YSBY0ql/qY2HOfe0Ae6REzBIMEhAacGq
         N5SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nY+BqXk1DYP4ITKpAYz7cAkQx4t8hhoZE7RF+CM52r0=;
        b=hapIg75mRYP4GgVB8ActLsJxQhps8Vz+vVIe4+WLN51IM0OlrQCH6emB2pRlrR7rYm
         xnMED73mq0RzpWjLoeU84MuVFShJSG2B0preVd7NoPkBsmy8kXwh6G3/o+p0afF8gdKH
         1e9VlB9znrIsUZx5IXCAEsLKR5UqpaJ2lj1oIuA3aWW6BuLYdbLBfCtpB7eanORZy28M
         IrV5RPOW4l7szvtWmjuCzOM4voXJoa71Rn0l820GqOGF6/bfKoX2ByZoY6k59tu2bwpM
         ql3A8HKsJdMcgCNIXSJzh7c7JbjRrODadn+/QTay8b4QEqqtKg7mkgHM2ji+udE0s5rk
         VWiA==
X-Gm-Message-State: APjAAAWovE2mI9741wkH9BT1fJetP9ALIphA3YJDYx1pmnDJC3nKPIM2
        PSVEzL686OKSegjcR3jJVTzLc9Nd56hQlg==
X-Google-Smtp-Source: APXvYqyR9IfrHikX5KfgDSjiJreYpoSpQLjGYC446cIDL9nWxOpmG+cH10oHQdDdQZjL1au08tK74g==
X-Received: by 2002:a2e:8847:: with SMTP id z7mr22326937ljj.51.1561464298849;
        Tue, 25 Jun 2019 05:04:58 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id u13sm1958867lfl.61.2019.06.25.05.04.56
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2019 05:04:57 -0700 (PDT)
Date:   Tue, 25 Jun 2019 04:46:01 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM64 Based SoC DT Updates for v5.3
Message-ID: <20190625114601.emnljkmjuw7tlaa7@localhost>
References: <cover.1561107232.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1561107232.git.horms+renesas@verge.net.au>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 21, 2019 at 11:16:27AM +0200, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these Renesas ARM64 based SoC DT updates for v5.3.
> 
> I apologise that this pull request ended up somewhat larger than I
> expected. It would have been better if I sent what was ready a
> few weeks ago at that time. However, by the time I realised this
> it was too late.
> 
> 
> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
> 
>   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm64-dt-for-v5.3
> 
> for you to fetch changes up to f6130381e2a20b0503838477462a3f55f7672434:
> 
>   arm64: dts: renesas: hihope-common: Remove "label" from LEDs (2019-06-19 16:32:13 +0200)


Merged, thanks!


-Olof
