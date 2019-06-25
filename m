Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 679BC54E43
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2019 14:04:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbfFYMEz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jun 2019 08:04:55 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45893 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726557AbfFYMEz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jun 2019 08:04:55 -0400
Received: by mail-lj1-f194.google.com with SMTP id m23so15945213lje.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jun 2019 05:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=IS8jSsu0/5v/tOlUobYv0GLSxrxflUDuHOzyY3AITEA=;
        b=SbKuiUAYxqW1W65wTF0lcS3lAcZx1nzhzPSc/bAnmQ6UfF+OClrTmPGUhzjbzamOWk
         0whDtlfn7Xq9HKNV3vHiwHm0RiqPLLQU1/oYMWsiOaFKxaRFWrEV0dyhvQCx+FZVXgBp
         03AMXILQ9sov1LgLeKv3nrGctaJdJPERrs+3+Nu0vEpXl/4TX0pCWBxEaHMnyLqtDmWo
         vHLHzpgIvoabtHkcxhhG3rf3+Q9OY3OmEC7tYWeU8HHFRh+6jzpfftDaSywiY5xjCglO
         uSZvmPlbZ6Cv0SZxr3Azkr8uEbHhfFqe8Iq4ZM+knqugYWbibxXVlBRbPnGpQOXzYf6E
         er2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IS8jSsu0/5v/tOlUobYv0GLSxrxflUDuHOzyY3AITEA=;
        b=EL1x7EBK4iUnAhJR9XzT/lPh2pcnurpcoMbeNRf9+MIZF7SPyS5qs6jiNLSPDGDcYe
         9aI4+xqeEfukR8B7FVBKxHX5xSaKov9k3M/NZ3HuJ7xKodPpGM0D0KsxBxD/x7nvM7Nf
         bJLTEJBPiWZVH6g4Vnk0vyhKQmwxuNGhzWSqztpFhwwobLiRa2GeXr/dIZQ6xUj7P+nx
         RB31GuzLKo/WedJFhMOb3schdvzF/mGq6U82xCiqf9xZ7UhSeqxsq13vMRqFM4ZHPDI8
         4+TzT4uZCci025pJJs4niwqxBtNnZHrILS4+pYfx5vclCiTOeGcrnHdpgiEJ7iTJkjdy
         bbWA==
X-Gm-Message-State: APjAAAX/DEKeEH9RpXtmQHxo9Rm3RJiFW756AZ3i7ZRUWNqVGvDDG52l
        kPAjg/f1mEk9N2VPW3L8JfO9e0daUb0qBQ==
X-Google-Smtp-Source: APXvYqzz/mup7OzTKlrrQYohsWEgvr6qCQYebYIxj2U12y2O5/jMOqn5Z7dwwFtef/mfIuCS9QZTWw==
X-Received: by 2002:a2e:9b57:: with SMTP id o23mr36637966ljj.67.1561464293000;
        Tue, 25 Jun 2019 05:04:53 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id 72sm2222586ljj.104.2019.06.25.05.04.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2019 05:04:51 -0700 (PDT)
Date:   Tue, 25 Jun 2019 04:43:51 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [GIT PULL] Renesas ARM Based SoC DT Bindings Updates for v5.3
Message-ID: <20190625114351.66osq3ejvwhqgp53@localhost>
References: <cover.1561107729.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1561107729.git.horms+renesas@verge.net.au>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 21, 2019 at 11:10:54AM +0200, Simon Horman wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
> 
> Please consider these Renesas ARM based SoC DT bindings updates for v5.3.
> 
> I have collected CMT and CAN controller patches that were slipping through
> the cracks into this pull request. They have been acked by the relevant
> maintainers.
> 
> 
> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
> 
>   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-dt-bindings-for-v5.3

Merged, thanks!


-Olof
