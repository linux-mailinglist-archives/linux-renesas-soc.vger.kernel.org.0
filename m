Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B55994567D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2019 09:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725801AbfFNHg5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 14 Jun 2019 03:36:57 -0400
Received: from mga18.intel.com ([134.134.136.126]:10796 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725789AbfFNHg5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Jun 2019 03:36:57 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 Jun 2019 00:36:56 -0700
X-ExtLoop1: 1
Received: from mtayar-mobl.ger.corp.intel.com (HELO [10.252.34.38]) ([10.252.34.38])
  by orsmga002.jf.intel.com with ESMTP; 14 Jun 2019 00:36:50 -0700
Subject: Re: [PATCH] drm/amdgpu: Fix connector atomic_check compilation fail
To:     Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Eric Anholt <eric@anholt.net>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        David Airlie <airlied@linux.ie>, Lyude Paul <lyude@redhat.com>,
        Karol Herbst <karolherbst@gmail.com>,
        Ilia Mirkin <imirkin@alum.mit.edu>,
        intel-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Harry Wentland <harry.wentland@amd.com>,
        Leo Li <sunpeng.li@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
        amd-gfx@lists.freedesktop.org
References: <20190614002713.141340-1-sean@poorly.run>
From:   Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <5e864c26-d106-c947-3047-d45048d5f327@linux.intel.com>
Date:   Fri, 14 Jun 2019 09:36:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614002713.141340-1-sean@poorly.run>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Op 14-06-2019 om 02:27 schreef Sean Paul:
> From: Sean Paul <seanpaul@chromium.org>
>
> I missed amdgpu in my connnector_helper_funcs->atomic_check conversion,
> which is understandably causing compilation failures.
>
> Fixes: 6f3b62781bbd ("drm: Convert connector_helper_funcs->atomic_check to accept drm_atomic_state")
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com> [for rcar lvds]
> Cc: Sean Paul <seanpaul@chromium.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Karol Herbst <karolherbst@gmail.com>
> Cc: Ilia Mirkin <imirkin@alum.mit.edu>
> Cc: dri-devel@lists.freedesktop.org
> Cc: intel-gfx@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> Reported-by: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 3a723e553a193..3d5e828c3d284 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -3953,9 +3953,10 @@ is_hdr_metadata_different(const struct drm_connector_state *old_state,
>  
>  static int
>  amdgpu_dm_connector_atomic_check(struct drm_connector *conn,
> -				 struct drm_connector_state *new_con_state)
> +				 struct drm_atomic_state *state)
>  {
> -	struct drm_atomic_state *state = new_con_state->state;
> +	struct drm_connector_state *new_con_state =
> +		drm_atomic_get_new_connector_state(state, conn);
>  	struct drm_connector_state *old_con_state =
>  		drm_atomic_get_old_connector_state(state, conn);
>  	struct drm_crtc *crtc = new_con_state->crtc;

Thanks, applied. :)

