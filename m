Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02B79AA7F7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Sep 2019 18:05:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388113AbfIEQFf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Sep 2019 12:05:35 -0400
Received: from mail-qt1-f180.google.com ([209.85.160.180]:41342 "EHLO
        mail-qt1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731857AbfIEQFf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Sep 2019 12:05:35 -0400
Received: by mail-qt1-f180.google.com with SMTP id j10so3406287qtp.8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Sep 2019 09:05:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lg109LqwUiLzbnsvZnIE5S3uLfUGJu5WFRGWlk8oQEY=;
        b=oVBSmvA+1qe3EGsx/8xUvpP32dcEZRM7V96GRe2TGgdIu3YIXsoYnYFxPS9eIrRzqb
         Nu95y0eu9focztSntN51+0cysnXo0rp3A8bJjkPUY3xkyeJyj6bnFez+5oIpUfoUmWAO
         0CigwjO2vpEmb69+wDMyqUcooZKq4ukH+AyyXSnnfVbLRvnZjDK62l3xSVU9/bngAb3j
         TYSrrpP3VV9zJFSpD+IZcbQgKAv1vzA575RMkhekyb4et/c5SGregIg2NSd9Z3YJEl15
         SXq3ldVZmQZ7KlwBB1QzmB/HLVfghbdrd2TszC5KG9ORsoxKBMFessbJD/2/eILZrory
         dfwQ==
X-Gm-Message-State: APjAAAX/OjlwvxQQVZiqnYuOflbRQuq9uy13r2boq5ie/0T/Atdrwimk
        DJZseZ2suMkPmymzeV6p5VWyV/5zH1Me/PASXyY=
X-Google-Smtp-Source: APXvYqxDvgZ2yRXFWjbdos3lkIkaNj98UJxtxl6G+LczKFRjB8TICktafKdfNZOWMMw2yyu0ehS1eQf9S8oeI6mdnJs=
X-Received: by 2002:ac8:342a:: with SMTP id u39mr4393833qtb.7.1567699534284;
 Thu, 05 Sep 2019 09:05:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1567675986.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1567675986.git.horms+renesas@verge.net.au>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 5 Sep 2019 18:05:17 +0200
Message-ID: <CAK8P3a1tNCqrEi6DkRs3G6x11bx17u9vTCD8AG0GyV08ieFM3w@mail.gmail.com>
Subject: Re: [GIT PULL] Second Round of Renesas ARM Based SoC Fixes for v5.3
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Sep 5, 2019 at 11:35 AM Simon Horman <horms+renesas@verge.net.au> wrote:
>
> Hi Olof, Hi Kevin, Hi Arnd,
>
> Please consider these second round of Renesas ARM based SoC fixes for v5.3.
>
> This pull request is based on the previous round of
> such requests, tagged as renesas-next-20190813-v5.3-rc1,
> which you have already pulled.

Pulled into fixes, thanks!


      Arnd
