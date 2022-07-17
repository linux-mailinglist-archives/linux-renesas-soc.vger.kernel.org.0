Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F295577640
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Jul 2022 14:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230046AbiGQMzU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 17 Jul 2022 08:55:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbiGQMzU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 17 Jul 2022 08:55:20 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D63A413CF0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 17 Jul 2022 05:55:19 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id s27so8366882pga.13
        for <linux-renesas-soc@vger.kernel.org>; Sun, 17 Jul 2022 05:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=c9Yy8SFQquC83qapd1nIzWfb1DuLnZgsO9jTBPzSzFr/aZ2jNmf4xxnOhqSg3j610M
         dxh9kXgMsEJnk/gn0iqs9GGxrE6DNEGyY4Md7zv2EFm6Ue1aYtldsqdQB+tAs9xU97tw
         ytDq+NAELxDEze+uN30OOHO4FLQ9o7O1imcULM7/tT9qzb6BY6263D2lm5+BZBMVwKPV
         nZt9R37WHQ7dVVkcoMfqqTwkWpsO+MR+7zdYz7OSltKjF4ZSfIY+U9iXxthd8g0hl6Z9
         dRDLguGiYk5CXiA4Rvo3qIwplhTSXOyKC77r+NI4/BQ5b2I3w4qKfyZgLc21XzTBzBq3
         HwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=64qYSfseNFYrwHkvV6vjTgtMSBBqUZm4/ZQtp4mYEGA1+RQDA9mrwWxC0StfaNnx/4
         tEbNgBav7nT6XqL3p3is7FNHeojAvtnUSLTEDECJzQ/Y08LO98gr2X6IdQkaCUQNkrj6
         RJarbaiGTTC87v+9S3oibKe+aRGQYCcFNpbONUfQtb4PCCnBfnnntGQO6HYHUICJpExT
         HOmcl1Xw/eRBuqEnqUrZiX2ZN+as2IB0Z6Je5YBdI39jMcdm0wvTF6Foz6r0BE084UPY
         11WLnCtl79Ly4VNTiHKe1jeWfPBkBzvEhfurAZwxi4ATzxlpSfNYlxmVp6usdacrZwLC
         uKdQ==
X-Gm-Message-State: AJIora8EHfkLyW8yF2BZTL7Z0t7hwymbWAWvyq1qR8IEOjgtDfmHriiE
        2EExu/yh/1LBbHII12/c81kPm6yOb+ztJXHN6O8=
X-Google-Smtp-Source: AGRyM1vxJA7uSD5lYJi6F8N4vix/XkSsaCsh+adakeYaGPDqKxcikbjjJYPxx1fGZrVj+tOgQB+3pgx1C/UnyiUi0uQ=
X-Received: by 2002:a63:595f:0:b0:412:5adc:fb07 with SMTP id
 j31-20020a63595f000000b004125adcfb07mr21008732pgm.296.1658062519425; Sun, 17
 Jul 2022 05:55:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a10:a48d:b0:2b8:d23a:cfe7 with HTTP; Sun, 17 Jul 2022
 05:55:18 -0700 (PDT)
Reply-To: nas2ri@yahoo.com
From:   j n <tel802e@gmail.com>
Date:   Sun, 17 Jul 2022 05:55:18 -0700
Message-ID: <CA+byAN49BVt7doETcF_DDRg=rkPP78PPWZ9-1AfsjotqL6xZbA@mail.gmail.com>
Subject: I am writing to find out if you would be willing to receive a
 donation of fund?
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


