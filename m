Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49456712187
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 May 2023 09:52:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242569AbjEZHvf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 May 2023 03:51:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242563AbjEZHve (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 May 2023 03:51:34 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A6DCB6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 May 2023 00:51:32 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-30ab87a1897so198251f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 May 2023 00:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685087491; x=1687679491;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vSVgumf2aYp2qt988Utmhrty6r7JgjUMOf1vhbwIgVM=;
        b=HH5IiCPntBHLkYgsL6QiZABhfwdHOLeWhFCRMFlSrGxNr0L6dthPHyJdIRMAKrNra4
         63y/pgAi76VZNZg0zBgqvC9gEtmELmw4909Dch4ly3pRBSSU2o29JYoYKWcrkNRt8rZQ
         sVNEXmvWppWi8rxFncKzKQkDXggzNOdrZejLBhQerNkXnXtIys5WvpDo7R6dYYm8ezzB
         XggJyDbjjVC/FF0fuEVFdSofvxpKLGVkZWpojkWVvPqwEFmY4u+PNhbxdmPf52zHA0sp
         tQzdzBATgOL+W8yHTaJaYx4x8bI0xNJPhLLNeLe0mxq2KEmTR7EV+y9z7GawBx2M/h3E
         hMVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685087491; x=1687679491;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vSVgumf2aYp2qt988Utmhrty6r7JgjUMOf1vhbwIgVM=;
        b=a7yzCE/5bI3a8KaS6mhvr/EJ/4dJygB0c2nwMgBf4/1WFOm9V6Fhwz2KmhaWSpdA2a
         a3oM9SuwfWttmuj5aWuAGQB8iLkScg/3yBUy5nhc2Tur2bk8ujcpEnxghFHiGU92VhTU
         884wFwfE37ZsBcbZRIwnQj+HERYJ+Qa7EEBzeypia/pLV7iJyRzfc48ousI3YT4GRll+
         aiVtKXZ/+/lvjdxWVsReNLjOJ41mWCPgh/A7jBB+KVcjLMLlh6NFKrASmA6rE9h2PHBN
         fE93qIucN8oQY8DoshSh3eN2LaegcXtPWeUry0pIDj4uk++ME7QkaauQm5WX5v3K9zcT
         m+ZQ==
X-Gm-Message-State: AC+VfDzfUZi9fVaEHEXiYSE4ojS2budZdz7mSZ4hF7t4KpSTjX6urGfo
        NWghu9Taa0k/T/MoK1NsgfhmSw==
X-Google-Smtp-Source: ACHHUZ5BAKGgVMedwMdSbhQAr3bu64t8rjg7+27iN2I67Zd0S3+ppfH0i4SJBLQfQVLsllKAFRx2Cw==
X-Received: by 2002:a5d:4d02:0:b0:30a:c2c4:7133 with SMTP id z2-20020a5d4d02000000b0030ac2c47133mr621730wrt.49.1685087490812;
        Fri, 26 May 2023 00:51:30 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id f7-20020a7bc8c7000000b003f42158288dsm7873151wml.20.2023.05.26.00.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 00:51:30 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
To:     Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
In-Reply-To: <cover.1684931026.git.geert+renesas@glider.be>
References: <cover.1684931026.git.geert+renesas@glider.be>
Subject: Re: [PATCH 0/2] drm/panel: simple: Add support for Ampire
 AM-800480L1TMQW-T00H
Message-Id: <168508748966.1489292.6504449064133741624.b4-ty@linaro.org>
Date:   Fri, 26 May 2023 09:51:29 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Wed, 24 May 2023 14:32:09 +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> This patch series adds support for the Ampire AM-800480L1TMQW-T00H 5"
> WVGA TFT LCD panel, which can be found on e.g. the Atmark Techno
> Armadillo-800-EVA development board.
> 
> It has been tested with a WIP DT-enhanced version of the shmob-drm
> driver.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/2] dt-bindings: display: panel-simple: Add Ampire AM-800480L1TMQW-T00H
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=d3a6c2b60f07c64631b9437032d8f079341b7a16
[2/2] drm/panel: simple: Add Ampire AM-800480L1TMQW-T00H
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=410bb21319f69c2ec28aeafe530d00ed2f6a1c54

-- 
Neil

