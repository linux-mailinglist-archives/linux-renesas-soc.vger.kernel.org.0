Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A7334C4BCC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Feb 2022 18:15:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242858AbiBYRPn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Feb 2022 12:15:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238153AbiBYRPm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Feb 2022 12:15:42 -0500
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D83F21BB707
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Feb 2022 09:15:08 -0800 (PST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id CC9AE580207;
        Fri, 25 Feb 2022 12:15:07 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 25 Feb 2022 12:15:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; bh=xNQNRlLUw5C9YQ
        EvZZD0MEyciFB6BjZ9uMmdZ0lur38=; b=smBW7DY78kE8m2hKyM+42lI4nb439E
        fNGZnGmyniZzN3NFqItnjSHFunJ0oF2d+5QWsfnrm+KztCA2xFu7j7IqiQG+zTte
        MAzEJlincC4byL7d5oRlXo82GoTJFVXXsivmrghxAcE3oLUdWQaP136S00PRMs+W
        pcHfRX7YqsZG4acLBPLFMK41gG/tca6GTrmZ+qC7I+NH+mFnmURoAtBbuLXGAbky
        lzKIF2mSB2xlmaVab/iUISYFZU0U4mCfv4HHfHp6TAC7uTdgwTrtFsrFuBMTPDd5
        xz6dxVIbvLEpp71Y/vdLXET4MPGyxpi85EEJYNW64BnJOkucLj40mDaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=xNQNRlLUw5C9YQEvZZD0MEyciFB6BjZ9uMmdZ0lur
        38=; b=h9KQFBydBEJEBxHstMqdKjCkTo6dl50hLa+E7jj71q/yqFWZIhi90+nPk
        fi8ALea0MNK2hq02mXaTBYsEX/YiVibAI+3tQKlzCdouUlk7DUYl1oBeombWzZ/m
        fFO2UqnIjWrb7zITB4g6aRrk6RhTXThfUex4eghP+9/+tsfY2GTDp/yjyR6yZNvj
        9pcoI0/KGwWgxCyw+WbVsVXhsMmGu+6eulm0abZMm3CjNHnOrYcY86BuwLiRxAPN
        lqzhsBURdneLBGAAYggIRwxkT5B++07NzZxcOJpUREGXsc+UIPchz2RwOVEo0MLL
        sNUCiD6nCZIGrFyizYaugClZUzv7Q==
X-ME-Sender: <xms:mw4ZYk4vg4Q7_5vZttQHW_xG_aKk-GN2SAnmUAVHPqBGZsru3Tm5MA>
    <xme:mw4ZYl5UOdDYESdnlchG0HDaiWRlPHg4Dyt2Xxz6nRNSpSwwWLJFTbx6wDBix5sU_
    z4DwXl3ywicGZz7_yE>
X-ME-Received: <xmr:mw4ZYje4PWw3uPlDz93m6rdkQpYGkmhafe10LJTqXkpoHklv_q1Un0-idoUKiQ6a8jb18StefAB3fdGBcpt9lmXBrHh0CVw01k2JzvY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleeggdellecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
    keeknecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:mw4ZYpJFYFMufgnfr-z7VupGsFIqqIiNWKJRZh5QaCu7JgoWnmS7SA>
    <xmx:mw4ZYoKPWvlp0uBuGpp-gieqfmj6ReKyr84knKuzCqcveRFY3Vo4YA>
    <xmx:mw4ZYqyCPBHbncwFz4LOyKp4eWBnRciusl7h065ZeqPi1ND2tBPZuA>
    <xmx:mw4ZYmyY6M0h6CG2rlJJK7lYPZHG3ffV3hYR0QXvubJGponxNPjB8g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Feb 2022 12:15:07 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Maxime Ripard <maxime@cerno.tech>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel.vetter@intel.com>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Dom Cobley <dom@raspberrypi.com>
Subject: Re: (subset) [PATCH v2 15/22] drm/rcar: plane: Remove redundant zpos initialisation
Date:   Fri, 25 Feb 2022 18:14:45 +0100
Message-Id: <164580928297.726994.13240358385635559463.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221095918.18763-16-maxime@cerno.tech>
References: <20220221095918.18763-1-maxime@cerno.tech> <20220221095918.18763-16-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 21 Feb 2022 10:59:11 +0100, Maxime Ripard wrote:
> The rcar-du KMS driver will call drm_plane_create_zpos_property() with an
> init value depending on the plane type.
> 
> Since the initial value wasn't carried over in the state, the driver had
> to set it again in rcar_du_plane_reset() and rcar_du_vsp_plane_reset().
> However, the helpers have been adjusted to set it properly at reset, so
> this is not needed anymore.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
